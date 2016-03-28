class Child < ActiveRecord::Base
    belongs_to :parent
    belongs_to :group
    has_many :sent_invitations, class_name: "Invitation", as: :sender
    has_many :received_invitations, class_name: "Invitation", as: :receiver
    
    def name
        self.firstname+' '+self.lastname
    end
end