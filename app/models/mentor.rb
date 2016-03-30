class Mentor < ActiveRecord::Base
    belongs_to :user
    has_many :groups
    
    def name
        self.firstname+' '+self.lastname
    end
    
    def self.all_genders
        %w(Male Female Unknown)
    end
    
    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    
    def self.all_grades
        %w(Freshman Sophomore Junior Senior Graduate Teacher)
    end
end
