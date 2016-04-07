class Group < ActiveRecord::Base
    has_many :children
    belongs_to :mentor
    belongs_to :admin, class_name: "Parent", foreign_key: "admin_id"
    has_many :invitations
    serialize :competitions
    def members
        list=[]
        self.children.each do |child|
            list.push(child.name)
        end
        list.join(', ')
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
