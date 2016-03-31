class MentorsController < ApplicationController
   
   def new 
       @mentor = Mentor.new
   end
   
   def create 
       @mentor = Mentor.new(mentor_params)
       @mentor.user_id = session[:user_id]
       @mentor.visible = true
    if @mentor.save
      flash[:notice] = "You have successfully filled your mentor file"
      flash[:color]= "valid"
      redirect_to mentor_path(@mentor) and return
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      redirect_to new_mentor_path and return
    end
  end
    
  def index
    @mentor = Mentor.find_by_user_id(session[:user_id])
  end
  
  def edit
    if !session[:user_id].nil?
      @mentor = Mentor.find_by_user_id(session[:user_id])
    else 
      redirect_to welcome_index_path
    end
  end
  
  def show
    if !session[:user_id].nil?
      @mentor = Mentor.find_by_user_id(session[:user_id])
      if !@mentor.nil?
        @id = @mentor.id
      else
        redirect_to new_mentor_path
      end
    else 
      redirect_to welcome_index_path
    end
  end
  
  def update
    if !session[:user_id].nil?
      @mentor = Mentor.find_by_user_id(session[:user_id])
      if @mentor.update_attributes!(mentor_params)
        redirect_to mentor_path(@mentor)
      else
        redirect_to edit_mentor_path
      end
    else 
      redirect_to welcome_index_path
    end
  end
  
  private 
  
  def mentor_params
    params.require(:mentor).permit(:firstname, :password, :lastname, :phone, :email, :gender, :age, :school, :grade, :time_slot, :competitions, :description, :user_id, :visible)
  end
  
end