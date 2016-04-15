class SessionsController < ApplicationController
  
  def new
    redirect_to '/auth/facebook'
  end
  
  def create
    fbuser = Fbuser.from_omniauth(env["omniauth.auth"])
    if !fbuser.user_id.nil?
      session[:user_id] = fbuser.user_id
      redirect_to parent_path and return
    end
    user=User.new
    user.role='Parent'
    user.username=fbuser.name
    user.save
    session[:user_id] = user.id
    session[:expires_at] = Time.current + 2.hours
    fbuser.user_id=user.id
    fbuser.save
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
   
  private
  def user_params
    params.require(:fbuser).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at)
  end
end
