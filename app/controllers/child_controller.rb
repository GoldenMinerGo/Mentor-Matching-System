class ChildController < ApplicationController
    def show
        # if session.key?(:id)==false
        #     redirect_to root_path
        # end
        # @user=User.find(session[:id]) 
        parent=Parent.where(:user_id => 1)[0]
        children=Child.where(:parent_id => parent)
        rinv = Invitation.where(:sender_id => params[:id], :receiver_id => children) #session[:id]
        
        @child = Child.find_by_id(params[:id])
        if (@child.nil? || (rinv.empty? && @child.parent.user_id != 1)) #session[:id]
            redirect_to parent_path and return
        end
        
        if @child.group_id.nil?
            @group = ''
            @mentor = ''
        elsif @child.group.mentor_id.nil?
            @group = @child.group.title
            @mentor = ''
        else
            @group = @child.group.title
            @mentor = @child.group.mentor.firstname + ' ' + @child.group.mentor.lastname 
        end
    end
end
