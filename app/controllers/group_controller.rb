class GroupController < ApplicationController
    def index
        @mentor = Mentor.find_by_id(session[:mentor_id])
        case params[:sort]
        when 'id'
            @groups = Group.where(:visible => true).order('id ASC')
        when 'title'
            @groups = Group.where(:visible => true).order('title ASC')
        when 'num'
            @groups = Group.where(:visible => true).sort_by{|g| g.children.count}
        else
            
        #@groups = Group.where(:visible => true).where.not(:admin_id => @parent)
            @groups = Group.where(:visible => true)
        #@members = @groups.members

            
        end

    end
    
    def show
        @group = Group.find_by_id(params[:id])
        @child = Child.find_by_id(params[:child_id])
        @sinvs = Groupinv.where(:group_id => @group.id).where(:send_by_mentor => false)
        #sinv means send invitation
        @rinvs = Groupinv.where(:group_id => @group.id).where(:send_by_mentor => true)
        #rinv means receive invitation
    end
    
    def edit
        #group 
        #user = User.find(1)
        #@parent = user.parent
        @child = Child.find_by_id(session[:child_id])
        @group = @child.group
    end
    
    def update
        @user = User.whois(session)
        @child = Child.find_by_id(session[:child_id])
        @group = Group.find_by_id(params[:id])
        if @group.update_attributes(group_params)
            redirect_to group_path(:id => @group.id,:child_id =>@child.id)
        else
            redirect_to parent_path
        end
    end
    
    def new
        @user = User.whois(session)
        redirect_to root_path and return if @user.nil?
        @id = params[:child_id]
        
        @group = Group.new
    end
    
    def create
        #add much informaton such as competition, mentor
        @user = User.whois(session)
        redirect_to root_path and return if @user.nil?
        @group = Group.new(group_params)
        @group.admin_id = @user.parent.id
        @group.visible = 'true'
        @child = Child.find_by_id(params[:child_id])
        if @group.save
            @child.group_id = @group.id
            @child.save!
            
            flash[:success] = "The group information has been created successfully"
            
            redirect_to parent_path and return
        else
            flash[:danger] = "The information you put is invalid"
            redirect_to parent_new_path and return
        end
    end
    
    def change
        @child = Child.find_by_id(params[:id])
        @group = @child.group
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
        flash[:success] = "Your group deleted."
    end
    
    
    private
    
    def group_params
        params.require(:group).permit(:title, :time_slot, :competitions, :str_com)
    end
    
end
