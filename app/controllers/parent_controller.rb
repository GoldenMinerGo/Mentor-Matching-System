class ParentController < ApplicationController
    def index
        @user=User.whois(session)
        @fbuser=Fbuser.whois(session)
        redirect_to root_path and return if @user.nil? && @fbuser.nil?
        if !@fbuser.nil?
            redirect_to parent_new_path and return if @fbuser.parent.nil?
        end
        if !@user.nil?
            redirect_to parent_new_path and return if @user.parent.nil?
        end
        
        if !@fbuser.nil?
            @parent=@fbuser.parent
        end
        if !@user.nil?
            @parent=@user.parent
        end
        @children=@parent.children
        @groups=Group.where(:admin_id => @parent)
        #to be changed
        @rinv=Invitation.where(:receiver_id => @children)
        @sinv=Invitation.where(:sender_id => @children)
    end
    
    def edit
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @parent=@user.parent
    end

    def update
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @parent=@user.parent
        if @parent.update_attributes(parent_params)
            flash[:success] = "Your personal information has been updated successfully"
            redirect_to parent_path
        else
            flash[:danger] = "The information you put is invalid"
            redirect_to parent_edit_path
        end
    end
    
    def new
        @user=User.whois(session)
        @fbuser=Fbuser.whois(session)
        redirect_to root_path and return if @user.nil? && @fbuser.nil?
        @parent=Parent.new
    end
    
    def create
        @user=User.whois(session)
        @fbuser=Fbuser.whois(session)
        redirect_to root_path and return if @user.nil? && @fbuser.nil?
        @parent=Parent.new(parent_params)
        if !@fbuser.nil?
            @parent.fbuser_id=@fbuser.id
        end
        if !@user.nil?
            @parent.user_id=@user.id
        end
        if @parent.save
            flash[:success] = "Your personal information has been created successfully"
            redirect_to parent_path and return
        else
            flash[:danger] = "The information you put is invalid"
            redirect_to parent_new_path and return
        end
    end
    
    private
    
    def parent_params
        params.require(:parent).permit(:firstname, :lastname, :phone, :email)
    end
    
end
