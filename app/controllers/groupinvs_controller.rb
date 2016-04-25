class GroupinvsController < ApplicationController

  def new
      
  end

  def create
    
  end
  
  def send_inv
      @groupinv = Groupinv.new
      @groupinv.group_id = params[:id]
      @groupinv.mentor_id = params[:mentor_id].to_i
      @groupinv.send_by_mentor = params[:send_by_mentor]
      @groupinv.status = "Pending"
      if @groupinv.save
        flash[:success] = "Invitation susccessfully sent!"
        GroupinvMailer.groupinv_received(@groupinv)
        if User.whois(session).role == "Parent"
          redirect_to group_path(params[:id]) and return
        elsif User.whois(session).role == "Mentor" || User.whois(session).role == "mentor" 
          redirect_to mentor_path(@groupinv.mentor_id) and return
        end  
      else
        flash[:warning] = "Oops!Invitation sent failed!"
        if User.whois(session).role == "Parent"
          redirect_to mentors_path and return
        elsif User.whois(session).role == "Mentor"
          redirect_to group_index_path and return
        end
      end
  end
  
  def accept_inv_mentor
    @groupinv = Groupinv.find_by_id(params[:id])
    edit_the_table(@groupinv)
    
    @groupinv.status = "Accepted"
    @groupinv.group.update(:mentor_id => @groupinv.mentor_id)
    @groupinv.mentor.update(:visible => false) 
    @groupinv.group.update(:need_mentor => false, :visible => false)
    if @groupinv.save
      changed_by_mentor = true
      GroupinvMailer.groupinv_changed(@groupinv, changed_by_mentor)
      GroupMailer.new_mentor_added(@groupinv)
      flash[:success] = "You joined the group!"
      redirect_to mentor_path(@groupinv.mentor_id) and return
    else
      flash[:warning] = "Oops!Try again!"
      redirect_to mentor_path(@groupinv.mentor_id) and return
    end
  end
  
  
  def accept_inv_group
    @groupinv = Groupinv.find_by_id(params[:id])
    edit_the_table(@groupinv)
    
    @groupinv.status = "Accepted"
    @groupinv.group.update(:mentor_id => @groupinv.mentor_id)
    @groupinv.mentor.update(:visible => false)
    @groupinv.group.update(:visible => false)
    if @groupinv.save
      changed_by_mentor = false
      GroupinvMailer.groupinv_changed(@groupinv, changed_by_mentor)
      flash[:success] = "You have a mentor now!"
      redirect_to group_path(@groupinv.group_id) and return
    else
      flash[:warning] = "Oops!Try again!"
      redirect_to group_path(@groupinv.group_id) and return
    end
  end
  
  def decline_inv
    @groupinv = Groupinv.find_by_id(params[:id])
    @groupinv.status = "Declined"
    if @groupinv.save
      flash[:success] = "You decline a mentor request"
      redirect_to group_path(@groupinv.group_id) and return
    else
      flash[:warning] = "Oops!Try again!"
      redirect_to group_path(@groupinv.group_id) and return 
   end
end 
 
  def cancel_inv
    @groupinv_cancel = Groupinv.find_by_id(params[:id])
    if @groupinv_cancel.present?
      @groupinv_cancel.destroy
    end
    if User.whois(session).role == "Parent"
      redirect_to group_path(params[:id]) and return
    elsif User.whois(session).role == "Mentor"
      redirect_to mentor_path(params[:id]) and return
    end   
  end
  

  
 
 private
  def edit_the_table(groupinv)
    @groupinv_others_mentor_decline = Groupinv.where(:mentor_id => @groupinv.mentor_id).where(:send_by_mentor => false)
    if !@groupinv_others_mentor_decline.nil?
      @groupinv_others_mentor_decline.each do |other| 
        other.status = "Declined"
        other.save
      end
    end
    
    @groupinv_others_mentor_delete = Groupinv.where(:mentor_id => @groupinv.mentor_id).where(:send_by_mentor => true)
    if !@groupinv_others_mentor_delete.nil?
      @groupinv_others_mentor_delete.each do |other|
        other.destroy
      end
    end
    
    @groupinv_others_group_decline = Groupinv.where(:group_id => @groupinv.group_id).where(:send_by_mentor => true)
    if !@groupinv_others_group_decline.nil?
      @groupinv_others_group_delcine.each do |other|
        other.status = "Declined"
        other.save
      end
    end
    
    @groupinv_others_group_delete = Groupinv.where(:group_id => @groupinv.group_id).where(:send_by_mentor => false)
    if !@groupinv_others_group_delete.nil?
      @groupinv_others_group_delete.each do |other|
        if !other.id == @groupinv.id
          other.destroy
        end
      end
    end
  end
end