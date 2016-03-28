class Parent < ActiveRecord::Base
    has_many :children
    belongs_to :user
    has_many :mygroups, class_name: "Group", as: :admin
    
    def name
        self.firstname+' '+self.lastname
    end
end
