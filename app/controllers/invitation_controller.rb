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
            session[:child_id] = @invitation.sender_id
            redirect_to group_path(@invitation.group) and return
        else
            flash[:warning] = "Warning! Invitation not sent!"
            redirect_to child_index_path and return
        end
        
    end
    
    def child_send_request_to_group
        @invitation = Invitation.new
        @invitation.group_id = params[:id]
        @invitation.sender_id = params[:sender_id]
        @invitation.receiver_id = params[:rec_id]
        @invitation.status = "Pending"
        if @invitation.save
            flash[:success] = "Invitation sent successfully!"
            redirect_to parent_path and return
        else
            flash[:warning] = "Warning! Invitation not sent!"
            redirect_to child_index_path and return
        end
    end
    
    def child_accept_group
        #把child存进组里
        @invitation = Invitation.find_by_id(params[:id])
        @invitation.receiver.update(:group_id => @invitation.group_id)
        #状态置为accepted
        @invitation.status = "Accepted"
        
        if @invitation.save!
            flash[:success] = "You have a group now!"
            #拒绝其他组的邀请
            @others_received = Invitation.where(:receiver_id => @invitation.receiver_id).where.not(:sender_id => @invitation.sender_id)
            @others_received.each do |o|
                o.status = "Declined"
                o.save!
            end
            #cancel child发出的请求
            @others_sent = Invitation.where(:sender_id => @invitation.sender_id).where.not(:receiver_id => @invitation.receiver_id)
            @others_sent.each do |o|
                o.destroy
            end
            redirect_to parent_path and return
        else
            flash[:warning] = "Oops!Try again!"
            redirect_to parent_path and return
        end
    end
    
    
    def group_accept_child
        
    end
    
    def decline_inv
        @invitation = Invitation.find_by_id(params[:id])
        @invitation.status = "Declined"
        if @invitation.save!
            redirect_to parent_path and return
        else
            flash[:warning] = "Oops!Try again!"
            redirect_to parent_path and return
        end
    end
    
    def cancel_inv
        @invitation = Invitation.find_by_id(params[:id])
        @invitation.destroy
        redirect_to parent_path and return
    end
end
