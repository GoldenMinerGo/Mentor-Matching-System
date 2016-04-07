class User < ActiveRecord::Base
    has_one :parent
    has_one :mentor
    
    def self.whois(session)
        session[:user_id] = nil if !session.key?(:expires_at) || session[:expires_at] < Time.current
        nil if !session.key?(:user_id)
        User.find_by_id(session[:user_id])
    end
    
    def self.all_roles
        %w(Parent Mentor)
    end
    
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
        user = User.find_by_username(username)
        if user && user.match_password(login_password)
            return user
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
    
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create
end
