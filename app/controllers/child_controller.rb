class ChildController < ApplicationController
    def index
        @user = User.whois(session)
        redirect_to root_path and return if @user.nil?
        if !session[:group_id].nil?
            
            @group = Group.find_by_id(session[:group_id])
        else
            flash[:warning] = "Invalid user!"
            reset_session
            redirect_to welcome_index_path and return
        end
        
        if !@user.nil? && @user.role == "Parent"
            case params[:sort]
            when 'age'
                @children=Child.where(:visible => true, :group => nil).order(date_of_birth: :desc)
            when 'time'
                @children=Child.where(:visible => true, :group => nil).sort_by{|c| @group.time_compare(c.time_slot)}.reverse
            else
                @children = Child.where(:visible => true, :group => nil)
            end
        else
            flash[:warning] = "Invalid user!"
            session[:user_id] = nil
            redirect_to welcome_index_path and return
        end
    end
    
    def show
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        #rinv = Invitation.where(:sender_id => params[:id], :receiver_id => @user.parent.children)
        
        @child = Child.find_by_id(params[:id])
        #if (@child.nil? || (rinv.empty? && @child.parent.user_id != @user.id))
            #flash[:warning] = "Sorry, your user account is not allowed to access this information."
            #redirect_to parent_path and return
        #end
        @mychild = @child.parent.user_id == @user.id
    end
    
    def detail
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child = Child.find_by_id(params[:id])
        @mychild = @child.parent.user_id == @user.id
        if @user.role == 'Parent'
            @group = Group.find_by_id(params[:group_id])
            @time_slot = [@child.time_slot, @group.time_slot].join(',')
        else
            @time_slot = @child.time_slot
        end
    end
    
    def message
        @user = User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child = Child.find_by_id(params[:id])
        if (@child.nil? ||  @child.parent.user_id != @user.id)
            flash[:warning] = "Sorry, your user account is not allowed to access this information."
            redirect_to parent_path and return
        end
        @rinv=Invitation.where(:receiver_id => @child).where(:sender_id => nil)
        @srequest = Invitation.where(:sender_id => @child).where(:receiver_id => nil)
    end
    
    
    def edit
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child = Child.find_by_id(params[:id])
        if (@child.nil? ||  @child.parent.user_id != @user.id)
            flash[:warning] = "Sorry, your user account is not allowed to access this information."
            redirect_to parent_path and return
        end
    end
    
    def update
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child = Child.find_by_id(params[:id])
        if (@child.nil? ||  @child.parent.user_id != @user.id)
            flash[:warning] = "Sorry, your user account is not allowed to access this information."
            redirect_to parent_path and return
        end
        if @child.update_attributes(child_params)
            flash[:success] = "Your child Information has been updated successfully"
            redirect_to child_path(@child.id) and return
        else
            flash[:danger] = "The information you put is invalid"
            redirect_to edit_child_path(@child) and return
        end
    end
    
    def new
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child=Child.new
    end
    
    def create
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child=Child.new(child_params)
        @child.parent_id = @user.parent.id
        if @child.save
            flash[:success] = "Your child has been created successfully"
            redirect_to parent_path and return
        else
            flash[:danger] = "The information you put is invalid"
            redirect_to new_child_path and return
        end
    end
        
    
    def destroy
        @user=User.whois(session)
        redirect_to root_path and return if @user.nil?
        @child=Child.find_by_id(params[:id])
        if @child.group.nil?
            @rinv = Invitation.where(:receiver => @child, :status => 'Pending')
            @rinv.each do |ri|
                ri.status = "Declined"
                ri.save!
            end
            @srequest = Invitation.where(:sender => @child, :status => 'Pending')
            @srequest.each do |sr|
                sr.destroy
            end
            @child.destroy
            
            redirect_to parent_path
            flash[:success]="You have deleted a child successfully!"
        else
            redirect_to parent_path
            flash[:warning]="Your child cannot be deleted before quitting the group!"
        end
    end
    
    def quit_group
        
        @child = Child.find_by_id(params[:id])
        GroupMailer.child_quit_request(@child).deliver_now
        redirect_to parent_path
        flash[:success] = "An email has been sent to the coach"
    end
    
    
    private
    
    def child_params
        params.require(:child).permit(:firstname, :lastname, :gender, :date_of_birth, :school, :grade, :time_slot, :competitions, :description, :visible)
    end
end
