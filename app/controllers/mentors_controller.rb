class MentorsController < ApplicationController
   
   def new 
       @mentor = Mentor.new
   end
   
  def create 
      @mentor = Mentor.new(mentor_params)
      @mentor.user_id = session[:user_id]
      @mentor.visible = true
        if @mentor.save
          flash[:success] = "You have successfully filled your mentor file"
          redirect_to mentor_path(@mentor) and return
        else
          flash[:warning] = "Form is invalid"
          redirect_to new_mentor_path and return
        end
  end
    
  def index
    user = User.whois(session)
    if !session[:group_id].nil? 
      @group = Group.find_by_id(session[:group_id])
      session.delete(:group_id)
    else
      flash[:warning] = "Invalid user!"
      reset_session
      redirect_to welcome_index_path and return
    end
    if !user.nil? && user.role == "Parent"
      @mentors = Mentor.where(:visible => true)
    else
      flash[:warning] = "Invalid user!"
      session[:user_id] = nil
      redirect_to welcome_index_path and return
    end
  end
  
  def edit
      @mentor = check_user_and_return_mentor(session)
  end
  
  def show
      @mentor = check_user_and_return_mentor(session)
      @user = User.whois(session)
      redirect_to new_mentor_path and return if @mentor.nil?
      @id = @mentor.id
      @age = @mentor.age
      @groups = @mentor.groups
      session[:mentor_id] = @mentor.id
      @sinvs = Groupinv.where(:mentor_id => @mentor.id).where(:send_by_mentor => true)
      @rinvs = Groupinv.where(:mentor_id => @mentor.id).where(:send_by_mentor => false)
  end
  
  def update
      @mentor = check_user_and_return_mentor(session)
      if @mentor.update_attributes(mentor_params)
        flash[:success] = "Successfully updated"
        redirect_to mentor_path(@mentor) and return
      else
        flash[:warning] = "Invalid input form"
        redirect_to edit_mentor_path(@mentor) and return
      end
  end
  
  def destroy
    @mentor = check_user_and_return_mentor(session)
    if @mentor.destroy
      flash[:success] = "You have successfully deleted your profile. Now you should be on the login page"
      session[:user_id] = nil
      redirect_to welcome_index_path
    else 
      flash[:warning] = "Something's wrong. Please try again"
      redirect_to mentor_path(@mentor)
    end
  end
  
  def quit_group
    @mentor = check_user_and_return_mentor(session)
    @group = Group.find_by_id(params[:id])
    @group.mentor_id = 0
    @group.save!
    redirect_to mentor_path(@mentor)
  end
    
    
  private 
  
  def mentor_params
    params.require(:mentor).permit(:firstname, :password, :lastname, :phone, :email, :gender, :date_of_birth, :school, :grade, :time_slot, :competitions, :description, :user_id, :visible)
  end
  
  def check_user_and_return_mentor(session)
    user = User.whois(session)
    redirect_to root_path and return if user.nil?
    user.mentor
  end
  
end