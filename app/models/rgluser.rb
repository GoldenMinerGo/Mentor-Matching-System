class Rgluser < ActiveRecord::Base
    belongs_to :user
    
    
    before_save :encrypt_password
    after_save :clear_password
    def encrypt_password
        if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
        end
    end
    def clear_password
        self.password = nil
    end
    
    def self.authenticate(username="", login_password="")
        rgluser = Rgluser.find_by_username(username)
        if rgluser && rgluser.match_password(login_password)
            return rgluser
        else
            return false
        end
    end   
    def match_password(login_password="")
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
    end
    
    def send_password_reset_email
        ParentMailer.password_reset(self).deliver_now
    end
    
    def password_reset_expired?
      reset_sent_at < 2.hours.ago
    end
    
    def create_reset_digest
        self.reset_token = Rgluser.new_token
        update_attribute(:reset_digest,  Rgluser.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end
    
    def name
        if self.user.role == "Parent"
            return self.user.parent.name if !self.user.parent.nil?
        else
            return self.user.mentor.name if !self.user.mentor.nil?
        end
        return "new user"
    end
    
    def firstname
        if self.user.role == 'Parent'
            return self.user.parent.firstname if !self.parent.nil?
        else
            return self.user.mentor.firstname if !self.mentor.nil?
        end
        return "new user"
    end
    
    def new_token
      SecureRandom.urlsafe_base64
    end
    
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create
    
    private
    
    def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
    
end
