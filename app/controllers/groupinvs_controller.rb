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
        if User.whois(session).role == "Parent"
          redirect_to group_path(params[:id]) and return
        elsif User.whois(session).role == "Mentor"
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
    @groupinv_others_decline = Groupinv.where(:mentor_id => session[:mentor_id]).where(:send_by_mentor => false)
    if !@groupinv_others_decline.nil?
      @groupinv_others_decline.each do |other| 
        other.status = "Declined"
        other.save
      end
    end
    @groupinv_others_delete = Groupinv.where(:mentor_id => session[:mentor_id]).where(:send_by_mentor => true)
    if !@groupinv_others_delete.nil?
      @groupinv_others_delete.each do |other|
        other.destroy
      end
    end
    @groupinv = Groupinv.find_by_id(params[:id])
    @groupinv.status = "Accepted"
    @groupinv.group.update(:mentor_id => @groupinv.mentor_id)
    @groupinv.mentor.update(:visible => false) 
    @groupinv.group.update(:visible => false)
    if @groupinv.save
      flash[:success] = "You joined the group!"
      redirect_to mentor_path(@groupinv.mentor_id) and return
    else
      flash[:warning] = "Oops!Try again!"
      redirect_to mentor_path(@groupinv.mentor_id) and return
    end
  end
  
  
  def accept_inv_group
    @groupinv = Groupinv.find_by_id(params[:id])
    @groupinv_others_decline = Groupinv.where(:group_id => @groupinv.group_id).where(:send_by_mentor => true)
    if !@groupinv_others_decline.nil?
      @groupinv_others_decline.each do |other| 
        other.status = "Declined"
        other.save
      end
    end
    @groupinv_others_delete = Groupinv.where(:group_id => @groupinv.group_id).where(:send_by_mentor => false)
    if !@groupinv_others_delete.nil?
      @groupinv_others_delete.each do |other|
        other.destroy
      end
    end
    @groupinv.status = "Accepted"
    @groupinv.group.update(:mentor_id => @groupinv.mentor_id)
    @groupinv.mentor.update(:visible => false)
    @groupinv.group.update(:visible => false)
    if @groupinv.save
      flash[:success] = "You have a mentor now!"
      redirect_to  group_path(@groupinv.group_id) and return
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
end