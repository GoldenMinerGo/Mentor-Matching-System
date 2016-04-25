class Mentor < ActiveRecord::Base
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :groups
    serialize :competitions
    
    def name
        self.firstname+' '+self.lastname
    end
    
    def age 
        dob = self.date_of_birth
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end
    
    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :firstname, :presence => true
    validates :lastname, :presence => true
    validates :phone, :presence => true
    validates :gender, :presence => true
    validates :date_of_birth, :presence => true
    validate :is_valid_dob?
    validates :school, :presence => true
    validates :grade, :presence => true
    validates :time_slot, :presence => true
    validates :description, :length => { :in => 0..301}
    
    def self.all_grades
        %w(Freshman Sophomore Junior Senior Graduate Teacher)
    end
    
    private
    
    def is_valid_dob?
      errors.add(:dob, "Invalid date of birth") unless date_of_birth.past?
    end
    
end
