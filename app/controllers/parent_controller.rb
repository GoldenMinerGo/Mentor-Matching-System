class ParentController < ApplicationController
    def index
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        redirect_to parent_new_path and return if @user.parent.nil?
        @parent=@user.parent
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
        if @parent.update_attributes!(parent_params)
            flash[:success] = "Your personal information has been updated successfully"
            redirect_to parent_path
        else
            flash[:danger] = "The information you put is invalid"
            redirect_to edit_parent_path
        end
    end
    
    def new
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @parent=Parent.new
    end
    
    def create
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @parent=Parent.new(parent_params)
        @parent.user_id=@user.id
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
