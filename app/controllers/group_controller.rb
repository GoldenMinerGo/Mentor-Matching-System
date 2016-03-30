class GroupController < ApplicationController
    def index
        user = User.find(1)
        @parent = user.parent
        @groups = Group.where(:admin_id => @parent)[0]
        #@groups = Group.all
        #@members = @groups.members
    end
    
    def show
        
        
    end
    
    def edit
        #group 
        user = User.find(1)
        @parent = user.parent
        #@children=@parent.children
        #if you use where, @groups is an array, like [group1,group2],then
        #you use @groups directly, it's not a group instance, so report error.
        @groups = Group.where(:admin_id => @parent)
    end
    
    def update
        user=User.find(1)
        @parent=user.parent
        @groups=Group.where(:admin_id => @parent)[0]
        if @groups.update_attributes!(group_params)
            redirect_to group_path
        else
            redirect_to group_edit_path
        end
    end
    
    def create
        
    end
    
    def destroy
        user=User.find(1)
        @parent=user.parent
        @groups=Group.where(:admin_id => @parent)[0]
        @groups.destroy
       
        #redirect_to group_path 
        redirect_to child_path(2) #should be group_path
        flash[:notice] = "Movie deleted."
    end
    
    private
    
    def group_params
        params.require(:group).permit(:title)
    end
        
    
    
end
