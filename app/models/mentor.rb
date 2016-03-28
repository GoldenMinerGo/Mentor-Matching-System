class Mentor < ActiveRecord::Base
    belongs_to :user
    has_many :groups
    
    def name
        self.firstname+' '+self.lastname
    end
end
