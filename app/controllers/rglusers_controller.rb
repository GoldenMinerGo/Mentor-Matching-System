class RglusersController < ApplicationController  
  before_filter :save_login_state, :only => [:new, :create]
  
  def new
  end
  
  def create
    @user = User.new(user_params)
    @user.last_login_time = Time.zone.now
    if @user.save
      flash[:success] = "You signed up successfully"
      redirect_to welcome_index_path and return
    else
      flash[:warning] = "Form is invalid"
      redirect_to users_new_path and return
    end
  end

  
  def edit
  end
  
  def update
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :role, :encrypted_password, :salt, :password_confirmation, :last_login_time)
  end
end