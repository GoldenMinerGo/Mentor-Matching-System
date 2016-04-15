class RglusersController < ApplicationController  

  
  def new
  end
  
  def create
    @user = User.new
    @user.role='Parent'
    @user.last_login_time = Time.zone.now
    @user.save
    session[:user_id] = @user.id
    @rgluser = Rgluser.new(rgluser_params)
    @rgluser.user_id=@user.id
    @rgluser.role='Parent'
    if @rgluser.save
      flash[:success] = "You signed up successfully"
      @user.username=@rgluser.username
      @user.save
      if @rgluser.role=='Parent'
        redirect_to parent_new_path and return
      else
        redirect_to new_mentor_path and return
      end
    else
      flash[:warning] = "Form is invalid"
      redirect_to new_rgluser_path and return
    end
  end

  
  def edit
  end
  def update
  end
  def destroy
  end
  def show
  end
  def index
  end
  
  private
  
  def rgluser_params
    params.require(:rgluser).permit(:username, :password, :encrypted_password, :salt, :password_confirmation, :last_login_time)
  end
end