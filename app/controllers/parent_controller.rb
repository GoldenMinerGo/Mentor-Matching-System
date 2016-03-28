class ParentController < ApplicationController
    def index
        # if session.key?(:id)==false
        #     redirect_to root_path
        # end
        # @user=User.find(session[:id])
        @parent=Parent.where(:user_id => 1)[0]
        @children=Child.where(:parent_id => @parent)
        @rinv=Invitation.where(:receiver_id => @children)
        @sinv=Invitation.where(:sender_id => @children)
    end
    
    def edit
        # if session.key?(:id)==false
        #     redirect_to root_path
        # end
        # @user=User.find(session[:id])
        @parent=Parent.where(:user_id => 1)[0]
    end

    def update
        # if session.key?(:id)==false
        #     redirect_to root_path
        # end
        # @user=User.find(session[:id])
        @parent = Parent.where(:user_id => 1)[0]
        if @parent.update_attributes!(parent_params)
            redirect_to parent_path
        else
            redirect_to parent_path
        end
    end
    
    private
    
    def parent_params
        params.require(:parent).permit(:firstname, :lastname, :phone, :email)
    end
    
end
