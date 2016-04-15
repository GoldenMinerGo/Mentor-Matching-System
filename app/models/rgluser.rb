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
    
    def name
        if self.role == 'Parent'
            return self.parent.name if !self.parent.nil?
        else
            return self.mentor.name if !self.mentor.nil?
        end
        return "new user"
    end
    
    def firstname
        if self.role == 'Parent'
            return self.parent.firstname if !self.parent.nil?
        else
            return self.mentor.firstname if !self.mentor.nil?
        end
        return "new user"
    end
    
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create
end