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
    @mentor = Mentor.find_by_user_id(session[:user_id])
  end
  
  def edit
      @mentor = check_user_and_return_mentor(session)
  end
  
  def show
      @mentor = check_user_and_return_mentor(session)
      redirect_to new_mentor_path and return if @mentor.nil?
      @id = @mentor.id
  end
  
  def update
      @mentor = check_user_and_return_mentor(session)
      if @mentor.update_attributes!(mentor_params)
        redirect_to mentor_path(@mentor)
      else
        redirect_to edit_mentor_path
      end
  end
  
  private 
  
  def mentor_params
    params.require(:mentor).permit(:firstname, :password, :lastname, :phone, :email, :gender, :age, :school, :grade, :time_slot, :competitions, :description, :user_id, :visible)
  end
  
  def check_user_and_return_mentor(session)
    user = User.whois(session)
    redirect_to root_path and return if user.nil?
    user.mentor
  end
  
end