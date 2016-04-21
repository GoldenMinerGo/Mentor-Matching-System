class WelcomeController < ApplicationController
  
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = Rgluser.authenticate(welcome_params[:username],welcome_params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.user.id
      session[:expires_at] = Time.current + 2.hours
      authorized_user.user.update_columns(:last_login_time => Time.zone.now)
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
    if !User.find_by_id(session[:user_id]).nil? && User.find_by_id(session[:user_id]).role == "mentor"
      redirect_to cas_logout_path
    else
      session[:user_id] = nil
      redirect_to welcome_index_path
    end
  end
  
  def index
    @user = User.whois(session)
    if !@user.nil?
      redirect_to parent_path and return if @user.role=='Parent'
      if @user.role=='Mentor'
        if !@user.mentor.nil?
          redirect_to mentor_path(@user.mentor) and return
        else
          redirect_to new_mentor_path and return
        end
      end
    end

  end
  
  def forget_password
    
  end
  
  def send_password_email
    user = Parent.find_by_email(params[:email]).user
  end
  
  private 
  
  def welcome_params
      params.permit(:username, :login_password, :utf8, :authenticity_token, :commit)
  end
  
  def parent_signin
    
  end
end
