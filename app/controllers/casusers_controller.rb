class CasusersController < ApplicationController
    
before_filter CASClient::Frameworks::Rails::Filter, :except => [:cas_logout]

  def cas_login
    casuser = Casuser.find_by_cas_user_name(session[:cas_user])
    if !casuser.nil? && !casuser.user_id.nil?
      user = casuser.user
      session[:user_id] = user.id
      session[:expires_at] = Time.current + 2.hours
      user.last_login_time = Time.zone.now
      user.save
      redirect_to mentor_path(casuser.user) and return
    end
    new_casuser = Casuser.new
    new_casuser.cas_user_name = session[:cas_user]
    user=User.new
    user.role="Mentor"
    user.username = new_casuser.cas_user_name
    user.last_login_time=Time.zone.now
    user.save
    new_casuser.user_id = user.id    
    new_casuser.save
    session[:user_id] = user.id
    session[:expires_at] = Time.current + 2.hours
    redirect_to mentor_path(new_casuser.user)
  end

  def cas_logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end