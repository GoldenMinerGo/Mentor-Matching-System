class SessionsController < ApplicationController
  
  def new
    redirect_to '/auth/facebook'
  end
  
  def create
    fbuser = Fbuser.from_omniauth(env["omniauth.auth"])
    session[:fbuser_id] = fbuser.id
    redirect_to root_path
  end

  def destroy
    session[:fbuser_id] = nil
    redirect_to root_path
  end
  
   
  private
  def user_params
    params.require(:fbuser).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at)
  end
end
