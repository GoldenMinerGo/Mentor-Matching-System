class Group < ActiveRecord::Base
    has_many :children
    belongs_to :mentor, class_name: "Mentor", foreign_key: "mentor_id"
    belongs_to :admin, class_name: "Parent", foreign_key: "admin_id"
    has_many :invitations

    def members
        list=[]
        self.children.each do |child|
            list.push(child.name)
        end
        list.join(', ')
    end
    
    def time_combine(time_2)
        time_1 = time_slot.split(/,/)
        time_2 = time_2.split(/,/)
        combine_time_sum = ''
        for i in 0..6
            combine_time = (time_1[i].to_i & time_2[i].to_i).to_s
            combine_time_sum = [combine_time_sum, combine_time].join(',')
        end
        combine_time_sum
    end
    
    def time_compare(time_2)
        time_1 = time_slot.split(/,/)
        time_2 = time_2.split(/,/)
        same_time_sum = 0
        for i in 0..6
            same_time = (time_1[i].to_i & time_2[i].to_i).to_s(2).count('1')
            same_time_sum = same_time_sum + same_time
        end
        same_time_sum
    end
    
    #before_show do
    #    @group.title="RK"
    #
    before_destroy do
        self.children.each do |child|
            child.group_id = 0
            child.save!
        end
    end
    
end
