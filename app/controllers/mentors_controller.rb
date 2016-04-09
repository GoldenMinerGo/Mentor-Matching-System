class MentorsController < ApplicationController
   
   def new 
       @mentor = Mentor.new
   end
   
  def create 
      @mentor = Mentor.new(mentor_params)
      @mentor.user_id = session[:user_id]
      @mentor.visible = true
      redirect_to new_mentor_path and return if !@mentor.date_of_birth.past?
        if @mentor.save
          flash[:success] = "You have successfully filled your mentor file"
          redirect_to mentor_path(@mentor) and return
        else
          flash[:warning] = "Form is invalid"
          redirect_to new_mentor_path and return
        end
      else
  end
    
  def index
    @mentors = Mentor.where(:visible => true)
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
  end
  
  def update
      @mentor = check_user_and_return_mentor(session)
      redirect_to edit_mentor_path and return if !mentor_params[:date_of_birth].to_date.past?
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
    @mentor.destroy
    flash[:success] = "You have successfully deleted your profile. Now you should be on the login page"
    redirect_to welcome_index_path
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