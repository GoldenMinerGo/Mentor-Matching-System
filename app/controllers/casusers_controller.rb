class CasusersController < ApplicationController
    
before_filter CASClient::Frameworks::Rails::Filter

  def cas_login
    casuser = Casuser.find_by_cas_user_name(session[:cas_user])
    if !casuser.user_id.nil?
      session[:user_id] = casuser.user.id
      session[:expires_at] = Time.current + 2.hours
      casuser.user.last_login_time=Time.zone.now
      casuser.user.save
      redirect_to mentor_path(casuser.user) and return
    end
    new_casuser = Casuser.new
    new_casuser.cas_user_name = session[:cas_user]
    user=User.new
    user.role='Mentor'
    user.username = new_casuser.cas_user_name
    user.last_login_time=Time.zone.now
    user.save
    new_casuser.user_id = user.id    
    casuser.save
    session[:user_id] = user.id
    session[:expires_at] = Time.current + 2.hours
    redirect_to mentor_path(casuser.user)
  end

  def cas_logout
    session[:user_id] = nil
    CASClient::Frameworks::Rails::Filter.logout(self)
    redirect_to welcome_index_path
  end
end