class ChildController < ApplicationController
    def index
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        @children=Child.where(:visible => true).where.not(:parent_id => user.parent)
    end
    
    def show
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        rinv = Invitation.where(:sender_id => params[:id], :receiver_id => user.parent.children)
        
        @child = Child.find_by_id(params[:id])
        if (@child.nil? || (rinv.empty? && @child.parent.user_id != user.id))
            redirect_to parent_path and return
        end
        @mychild = @child.parent.user_id == user.id
        if @child.group_id.nil?
            @group = ''
            @mentor = ''
        elsif @child.group.mentor_id.nil?
            @group = @child.group.title
            @mentor = ''
        else
            @group = @child.group.title
            @mentor = @child.group.mentor.firstname + ' ' + @child.group.mentor.lastname 
        end
    end
    
    def edit
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        @child = Child.find_by_id(params[:id])
        if (@child.nil? ||  @child.parent.user_id != user.id)
            redirect_to parent_path and return
        end
    end
    
    def update
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        user=User.find(1)
        @child = Child.find_by_id(params[:id])
        if (@child.nil? ||  @child.parent.user_id != user.id)
            redirect_to parent_path and return
        end
        if @child.update_attributes!(child_params)
            redirect_to child_path(@child.id)
        else
            redirect_to edit_child_path(@child)
        end
    end
    
    def new
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        
    end
    
    def create
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        
    end
    
    def destroy
        # @user=User.whois(session)
        # redirect_to root_path and return if @user.nil?
        
    end
    
    private
    
    def child_params
        params.require(:child).permit(:firstname, :lastname, :gender, :school, :grade, :time_slot, :competitions, :description, :visible)
    end
end
