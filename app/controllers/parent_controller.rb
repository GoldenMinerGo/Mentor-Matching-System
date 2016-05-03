class ParentController < ApplicationController
    def index
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        redirect_to parent_new_path and return if @user.parent.nil?
        
        @parent=@user.parent
        #@children=@parent.children
        @groups=Group.where(:admin_id => @parent)
        #to be changed
        
        case params[:sort]
        #when 'group'
            #@children=@parent.children.sort_by{|c| c.group.title} 
        when '#'
            @children=@parent.children
        when 'name'
            @children=@parent.children.sort_by{|c| c.name}
        else
            @children=@parent.children
        end
        #@mygroups = @parent.mygroups
        #invitation received from group
        @rinv=Invitation.where(:receiver_id => @children).where(:sender_id => nil).where(:status => 'Pending')
        #invitation sent from my group
        @sinv=Invitation.where(:group_id => @groups).where(:sender_id => nil).where(:status => 'Pending')
        #request received from other child
        @rrequest = Invitation.where(:group_id => @groups).where(:receiver_id => nil).where(:status => 'Pending')
        #request sent from my child
        @srequest = Invitation.where(:sender_id => @children).where(:receiver_id => nil).where(:status => 'Pending')
        
        @cn = @rinv.count + @srequest.count
        @gn = @sinv.count + @rrequest.count
        
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
        redirect_to root_path and return if @user.nil? or !@user.parent.nil?
    end
    
    def create
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @parent=Parent.new(parent_params)
        @parent.user_id=@user.id
        if @parent.save
            flash[:success] = "Your personal information has been created successfully"
            #ParentMailer.account_activation(@parent).deliver_now
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
