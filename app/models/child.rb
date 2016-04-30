class Child < ActiveRecord::Base
    belongs_to :parent
    belongs_to :group
    has_many :sent_invitations, class_name: "Invitation", as: :sender
    has_many :relsceived_invitations, class_name: "Invitation", as: :receiver

    def name
        self.firstname+' '+self.lastname
    end
    
    def age 
        dob = self.date_of_birth
        now = Time.now.utc.to_date
        age_year = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
        if dob.month < now.month
            age_month = now.month - dob.month
        elsif dob.month > now.month
            age_month = now.month + 12 - dob.month
        else
            age_month = 0
        end
        if age_month == 0
            return age_year.to_s + ' years'
        elsif age_month == 1
            return age_year.to_s + ' years and ' + age_month.to_s + ' month'
        else
            return age_year.to_s + ' years and ' + age_month.to_s + ' months'
        end
    end
    
    validates :firstname, :presence => true
    validates :lastname, :presence => true
    validates :gender, :presence => true
    validates :school, :presence => true
    validates :grade, :presence => true
    validates :date_of_birth, :presence => true
    validate :is_valid_dob?
    validates :time_slot, :presence => true
    validates :description, :length => { :in => 0..301}
    
    private 
      def is_valid_dob?
          errors.add(:dob, "Invalid date of birth") unless !date_of_birth.nil? && date_of_birth.past?
      end
end
