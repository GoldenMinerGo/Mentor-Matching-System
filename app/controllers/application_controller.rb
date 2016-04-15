class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected 
  def authenticate_user
    if session[:user_id]
       # set current user object to @current_user object variable
      @current_user = User.find session[:user_id] 
      return true	
    else
      redirect_to(:controller => 'welcome', :action => 'index')
     return false
    end
  end
  def save_login_state
    if session[:user_id]
      if User.find_by_id(session[:user_id]).nil?
        session[:user_id] = nil
        redirect_to welcome_index_path and return
      end
      if User.find_by_id(session[:user_id]).role == "Parent"
        redirect_to(:controller => 'parent', :action => 'index')
      else
        redirect_to mentor_path(session[:user_id])
      end
      return false
    else
      return true
    end 
  end
  
  
  private
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
      if !@user.fbuser.nil?
        @fbuser = Fbuser.find(@user.fbuser.id)
      end
    end
  end
  helper_method :current_user
end
