class UsersController < ApplicationController  
  before_filter :save_login_state, :only => [:new, :create]
  
  def new
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You signed up successfully"
      redirect_to welcome_index_path and return
    else
      flash[:success] = "Form is invalid"
      redirect_to users_new_path and return
    end
  end
  
  def edit
    
  
  def update
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :role, :encrypted_password, :salt, :password_confirmation, :last_login_time)
  end
end