class MentorsController < ApplicationController
   
   def new 
       @mentor = Mentor.new
   end
   
   def create 
       @mentor = Mentor.new(mentor_params)
    if @mentor.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to welcome_index_path and return
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      redirect_to users_new_path and return
    end
  end
    
end