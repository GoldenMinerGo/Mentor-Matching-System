class Parent < ActiveRecord::Base
    has_many :children
    belongs_to :user
    belongs_to :fbuser
    has_many :mygroups, class_name: "Group", as: :admin
    
    def name
        self.firstname+' '+self.lastname
    end
    
    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :firstname, :presence => true
    validates :lastname, :presence => true
    validates :email, :presence => true, :format => EMAIL_REGEX
    validates :phone, :presence => true
    
end
