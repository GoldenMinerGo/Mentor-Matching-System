class MentorsController < ApplicationController
   
   def new 
       @mentor = Mentor.new
   end
   
  def create 
      @mentor = Mentor.new(mentor_params)
      @mentor.user_id = session[:user_id]
      @mentor.visible = true
      if @mentor.save && dob_valid(@mentor)
        flash[:success] = "You have successfully filled your mentor file"
        redirect_to mentor_path(@mentor) and return
      else
        flash[:warning] = "Form is invalid"
        redirect_to new_mentor_path and return
      end
  end
    
  def index
    @mentor = Mentor.where(:visible => true)
  end
  
  def edit
      @mentor = check_user_and_return_mentor(session)
  end
  
  def show
      @mentor = check_user_and_return_mentor(session)
      @user = User.whois(session)
      redirect_to new_mentor_path and return if @mentor.nil?
      @id = @mentor.id
      @age = age_calculate(@mentor.date_of_birth)
      @groups = @mentor.groups
      @groupnil = !@groups.empty?
  end
  
  def update
      @mentor = check_user_and_return_mentor(session)
      if @mentor.update_attributes(mentor_params) && dob_valid(@mentor)
        flash[:success] = "Successfully updated"
        redirect_to mentor_path(@mentor) and return
      else
        flash[:warning] = "Invalid input form"
        redirect_to edit_mentor_path and return 
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
    @group.save
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
  
  def age_calculate(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  
      
  def dob_valid(mentor)
    if !mentor.date_of_birth.past?
      flash[:warning] = "Date of Birth must be before today"
      nil
    else
      true
    end
  end
  
end