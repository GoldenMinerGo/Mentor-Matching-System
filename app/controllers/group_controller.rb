class GroupController < ApplicationController
    def index
        user = User.find(1)
        @parent = user.parent
        @groups = Group.where(:visible => true).where.not(:admin_id => @parent)
        #@groups = Group.all
        #@members = @groups.members
    end
    
    def show
        @group = Group.find_by_id(params[:id])
        
    end
    
    def edit
        #group 
        #user = User.find(1)
        #@parent = user.parent
        @group = Group.find_by_id(params[:id])
        #@children=@parent.children
        #if you use where, @groups is an array, like [group1,group2],then
        #you use @groups directly, it's not a group instance, so report error.
        #@groups = Group.where(:admin_id => @parent)
    end
    
    def update
        user=User.find(1)
        @parent=user.parent
        #@groups=Group.where(:admin_id => @parent)[0]
        @group = Group.find_by_id(params[:id])
        if @group.update_attributes(group_params)
            redirect_to group_path
        else
            redirect_to parent_path
        end
    end
    
    def create
        
    end
    
    def change
        @child = Child.find_by_id(params[:id])
        @group=@child.group
        @child.group_id = 0
        @child.save!
        redirect_to group_path(@group)

    end
    
    def destroy
        #user=User.find(1)
        #@parent=user.parent
        @group = Group.find_by_id(params[:id])
        @group.destroy
       
        #redirect_to group_path 
        redirect_to parent_path
        flash[:notice] = "Your group deleted."
    end
    

    private
    
    def group_params
        params.require(:group).permit(:title)
    end
end
