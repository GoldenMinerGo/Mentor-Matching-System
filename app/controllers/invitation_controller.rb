class InvitationController < ApplicationController
    
    def new
        
    end
    
    def create
        
    end
    
    def group_send_inv_to_child
        @invitation = Invitation.new
        @invitation.group_id = params[:id]
        #@invitation.sender_id = params[:sender_id]
        @invitation.receiver_id = params[:rec_id]
        @invitation.status = "Pending"
        if @invitation.save
            InvitationsMailer.new_invitation(@invitation)
            flash[:success] = "Invitation sent successfully!"
            #session[:child_id] = @invitation.sender_id
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
        
        @invitation.status = "Pending"
        if @invitation.save
            InvitationsMailer.new_invitation(@invitation)
            flash[:success] = "Request sent successfully!"
            
            redirect_to parent_path and return
        else
            flash[:warning] = "Warning! Request not sent!"
            redirect_to group_index_for_parent_path and return
        end
    end
    
    def child_accept_group
        #把child存进组里
        @invitation = Invitation.find_by_id(params[:id])
        @invitation.receiver.update(:group_id => @invitation.group_id)
        #状态置为accepted
        @invitation.status = "Accepted"
        @invitation.group.update(:time_slot => @invitation.group.time_combine(@invitation.sender.time_slot))
        
        if @invitation.save!
            InvitationsMailer.invitation_accepted(@invitation)
            GroupMailer.new_child_added(@invitation, @invitation.receiver)
            flash[:success] = "You have a group now!"
            #decline invitation from other groups
            @others_received = Invitation.where(:receiver_id => @invitation.receiver_id).where.not(:group_id => @invitation.group_id)
            @others_received.each do |o|
                o.status = "Declined"
                o.save!
            end
            #cancel request from this child
            @others_sent = Invitation.where(:sender_id => @invitation.receiver_id)
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
        #把child存进组里
        @invitation = Invitation.find_by_id(params[:id])
        @invitation.sender.update(:group_id => @invitation.group_id)
        #状态置为accepted
        @invitation.status = "Accepted"
        @invitation.group.update(:time_slot => @invitation.group.time_combine(@invitation.sender.time_slot))
        
        if @invitation.save!
            InvitationsMailer.invitation_accepted(@invitation)
            GroupMailer.new_child_added(@invitation, @invitation.sender)
            flash[:success] = "Your group have a new member now!"
            #Cancel other request from that child
            @others_received = Invitation.where(:sender_id => @invitation.sender_id).where.not(:group_id => @invitation.group_id)
            @others_received.each do |o|
                o.destroy
            end
            #Decline other invitations from other groups to that child
            @others_sent = Invitation.where(:receiver_id => @invitation.sender_id)
            @others_sent.each do |o|
                o.status = "Declined"
                o.save!
            end
            redirect_to parent_path and return
        else
            flash[:warning] = "Oops!Try again!"
            redirect_to parent_path and return
        end
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
