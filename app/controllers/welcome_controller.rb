class WelcomeController < ApplicationController
   def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.authenticate(welcome_params[:username],welcome_params[:login_password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username} "
      if authorized_user.role == 'Mentor'
        redirect_to new_mentor_path and return
      else authorized_user.role == 'Parent'
        redirect_to parent_path and return
      end
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      redirect_to welcome_index_path
    end
  end
  
  def index
    @user = User.whois(session)
    roleselect and return if !@user.nil?
  end
  
  
  private 
  
  def roleselect(authorized_user)
    if authorized_user.role == "mentor"
        redirect_to new_mentor_path and return
    elsif authorized_user.role == "parent"
        redirect_to parent_path and return
    else redirect_to welcome_index_path
    end
  end
  
  def welcome_params
      params.permit(:username, :login_password)
  end

end
