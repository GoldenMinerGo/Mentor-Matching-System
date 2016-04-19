class UserController < ApplicationController
    def new
        if params[:role] == 'Parent'
            redirect_to user_index_path(:role => 'Parent')
        else
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
