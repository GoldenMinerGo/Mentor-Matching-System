class ParentController < ApplicationController
    def index
        # if session.key?(:id)==false
        #     redirect_to root_path
        # end
        # @user=User.find(session[:id]) 
        @parent=Parent.where(:user_id => 1)
        @children=Child.where(:parent_id => @parent)
        @rinv=Invitation.where(:receiver_id => @children)
        @sinv=Invitation.where(:sender_id => @children)
    end
end
