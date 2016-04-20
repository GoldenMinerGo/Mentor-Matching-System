class InvitationController < ApplicationController
    
    def new
        
    end
    
    def create
        
    end
    
    def group_send_inv_to_child
        @invitation = Invitation.new
        @invitation.group_id = params[:id]
        @invitation.sender_id = params[:sender_id]
        @invitation.receiver_id = params[:rec_id]
        @invitation.status = "Pending"
        if @invitation.save
            flash[:success] = "Invitation sent successfully!"
            redirect_to group_path(:id => @invitation.group_id, :ch => @invitation.sender_id) and return
        else
            flash[:warning] = "Warning!Invitation not sent!"
            redirect_to child_index_path and return
        end
        
    end
    
    def child_send_request_to_group
        @invitation = Invitation.new
    
    end
    
    def child_accept_group
        #把child存进组里
        @invitation = Invitation.find_by_id(params[:id])
        @invitation.receiver.update(:group_id => @invitation.group_id)
        
        
        #cancel child发出的请求
        
        #拒绝其他组的邀请
        @invitation.status = "Accepted"
        #状态置为accepted
        if @invitation.save!
            flash[:success] = "You have a group now!"
            redirect_to parent_path and return
        else
            flash[:warning] = "Oops!Try again!"
            redirect_to parent_path and return
        end
    end
    
    def group_accept_child
        
    end
end
