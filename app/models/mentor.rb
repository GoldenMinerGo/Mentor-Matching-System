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
    validates :firstname, :presence => true
    validates :lastname, :presence => true
    validates :phone, :presence => true
    validates :gender, :presence => true
    validates :age, :presence => true
    validates :school, :presence => true
    validates :grade, :presence => true
    validates :time_slot, :presence => true
    validates :description, :length => { :in => 0..301}
    
    def self.all_grades
        %w(Freshman Sophomore Junior Senior Graduate Teacher)
    end
end
