class AdministratorsController < ApplicationController
    
    def new
        @rglusers = Rgluser.where(:role => "Parent")
    end
    
    def create
        rgluser = Rgluser.find_by_id(params[:id])
        user = rgluser.user
        rgluser.role = "Administrator"
        user.role = "Administrator"
        administrator = Administrator.new
        administrator.name = user.uername
        administrator.user_id = user.id
        rgluser.save
        user.save
        administrator.save
        redirect_to administrators_index_path
    end
    
    def index
        @name = User.find_by_id(session[:user_id])
    end
    
    def drop_table
        @mentors = Mentor.all
    end
    
    def delete_one
        mentor = Mentor.find_by_id(params[:id])
        groupinvs = Groupinv.where(:mentor_id => mentor.id)
        if !groupinvs.empty?
            groupinvs.each do |groupinv|
                groupinv.destroy
            end
        end
        casuser = Casuser.find_by_cas_user_name(mentor.user.username)
        casuser.destroy if !casuser.nil?
        if !mentor.groups.empty?
            group = mentor.groups.first
            group.mentor_id = nil
            group.save
        end
        usermentor = mentor.user
        usermentor.destroy
        mentor.destroy
        flash[:success] = "Deleted the mentor"
        redirect_to administrators_drop_table_path
    end
    
    def drop_all_mentor
        DatabaseCleaner.clean_with(:truncation, :only => ['groupinvs', 'mentors', 'casusers'])
        usermentors = User.where(:role => 'Mentor')
        usermentors.each do |usermentor|
            usermentor.destroy
        end
        groups = Group.all
        groups.each do |group|
            if !group.mentor_id.nil?
                group.mentor_id = nil
                group.need_mentor = true
            end
            group.save
        end
        redirect_to administrators_index_path
    end
end
