class Parent < ActiveRecord::Base
    has_many :children
    belongs_to :user
    has_many :groups
    
    def name
        self.firstname+' '+self.lastname
    end
end
