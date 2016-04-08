class WelcomeController < ApplicationController
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.authenticate(welcome_params[:username],welcome_params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      authorized_user.update_columns(:last_login_time => Time.zone.now)
      flash[:success] = "Wow Welcome again, you logged in as #{authorized_user.role} "
      if authorized_user.role == 'Mentor'
        redirect_to mentor_path(authorized_user) and return
      else 
        redirect_to parent_path and return
      end
    else
      flash[:warning] = "Invalid Username or Password"
      redirect_to welcome_index_path
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to welcome_index_path
  end
  
  def index
    @user = User.whois(session)
  end
  
  
  private 
  
  def welcome_params
      params.permit(:username, :login_password, :utf8, :authenticity_token, :commit)
  end

end
