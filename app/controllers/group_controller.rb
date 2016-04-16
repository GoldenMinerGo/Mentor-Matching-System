class GroupController < ApplicationController
    def index
        user = User.find(1)
        @parent = user.parent
        #@groups = Group.where(:visible => true).where.not(:admin_id => @parent)
        @groups = Group.all
        #@members = @groups.members
    #sort
    if(params[:sort].to_s == 'title')
      session[:sort] = params[:sort]
      if(@groups==nil)
        @groups=Group.order('title')
      elsif
        @groups = @groups.sort_by{|m| m.title}
      end
      
      elsif(params[:sort].to_i == 'children.count')
      session[:sort] = params[:sort]
      if(@groups==nil)
        @groups=Group.order('children.count')
      elsif
        @groups = @groups.sort_by{|m| m.children.count}
      end
      
      elsif(session.has_key?(:sort))
      params[:sort]=session[:sort]
      @redirect=true
      end
    
    end
    
    def show
        @group = Group.find_by_id(params[:id])
        
    end
    
    def edit
        #group 
        #user = User.find(1)
        #@parent = user.parent
        @group = Group.find_by_id(params[:id])
        
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
    
    def new
        @user = User.whois(session)
        redirect_to root_path and return if @user.nil?
        @group = Group.new
    end
    
    def create
        #add much informaton such as competition, mentor
        @user = User.whois(session)
        redirect_to root_path and return if @user.nil?
        @group = Group.new(group_params)
        @group.admin_id = @user.parent.id
        @child = Child.find(5)
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
