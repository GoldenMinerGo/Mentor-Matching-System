class UserController < ApplicationController
    def new
        if params[:role] == 'Parent'
            @user = User.new
            @user.role='Parent'
            @user.last_login_time = Time.zone.now
            @user.save
            session[:user_id] = @user.id
            redirect_to user_index_path(:role => 'Parent')
        else
            @user = User.new
            @user.role='Mentor'
            @user.last_login_time = Time.zone.now
            @user.save
            session[:user_id] = @user.id
            redirect_to user_index_path(:role => 'Mentor')
        end
        
    end
    
    def index
        if params[:role] == 'Parent'
            @role='Parent'
        else
            @role='Mentor'
        end
    end
end
