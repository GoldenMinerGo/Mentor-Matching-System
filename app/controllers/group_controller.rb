class GroupController < ApplicationController
    def index
        user = User.find(4)
        @parent = user.parent
        @groups = Group.where(:admin_id => @parent)[0]
        #@groups = Group.all
        #@members = @groups.members
    end
    
    def edit
        #group 
        user = User.find(4)
        @parent = user.parent
        #@children=@parent.children
        #if you use where, @groups is an array, like [group1,group2],then
        #you use @groups directly, it's not a group instance, so report error.
        @groups = Group.where(:admin_id => @parent)
    end
    
    def update
        user=User.find(4)
        @parent=user.parent
        @groups=Group.where(:admin_id => @parent)[0]
        if @groups.update_attributes!(group_params)
            redirect_to group_path
        else
            redirect_to group_edit_path
        end
    end
    
    def destroy
        user=User.find(4)
        @parent=user.parent
        @groups=Group.where(:admin_id => @parent)[0]
        @groups.destroy
        #flash[:notice] = "Your group '#{@groups.title}' closed."
        redirect_to group_path
    end
    
    private
    
    def group_params
        params.require(:group).permit(:title)
    end
        
    
    
end
