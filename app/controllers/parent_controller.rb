class ParentController < ApplicationController
    def index
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        @parent=user.parent
        @children=@parent.children
        @groups=Group.where(:admin_id => @parent)
        @rinv=Invitation.where(:receiver_id => @children)
        @sinv=Invitation.where(:sender_id => @children)
        @groupnil= !@groups.empty?
    end
    
    def edit
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        @parent=user.parent
    end

    def update
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        @parent=user.parent
        if @parent.update_attributes!(parent_params)
            redirect_to parent_path
        else
            redirect_to edit_parent_path
        end
    end
    
    
    
    private
    
    def parent_params
        params.require(:parent).permit(:firstname, :lastname, :phone, :email)
    end
    
end
