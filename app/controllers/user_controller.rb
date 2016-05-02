class UserController < ApplicationController
    def new
        if params[:role] == 'Parent'
            redirect_to user_index_path(:role => 'Parent')
        end
    end
    
    def index
        @user = User.whois(session)
        if !@user.nil?
            redirect_to parent_path and return if @user.role=='Parent'
            if @user.role=='Mentor'
                redirect_to mentor_path(@user) and return
            end
        end
        if params[:role] == 'Parent'
            @role='Parent'
        end
    end
    
end
