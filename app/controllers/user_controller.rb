class UserController < ApplicationController
    def new
        if params[:role] == 'Parent'
            redirect_to user_index_path(:role => 'Parent')
        end
    end
    
    def index
        if params[:role] == 'Parent'
            @role='Parent'
        end
    end
    
end
