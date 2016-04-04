class Child < ActiveRecord::Base
    belongs_to :parent
    belongs_to :group
    has_many :sent_invitations, class_name: "Invitation", as: :sender
    has_many :relsceived_invitations, class_name: "Invitation", as: :receiver
    serialize :competitions, Array
    def name
        self.firstname+' '+self.lastname
    end
    
    before_save do
        self.competitions = self.str_com.split(/\s*,\s*/)
        self.competitions.uniq!
        self.str_com = self.competitions.join(',')
    end
    
    validates :firstname, :presence => true
    validates :lastname, :presence => true
    validates :gender, :presence => true
    validates :age, :presence => true, numericality: { less_than_or_equal_to: 20 }
    validates :school, :presence => true
    validates :grade, :presence => true
    validates :time_slot, :presence => true
    validates :description, :length => { :in => 0..301}
end
