class User < ActiveRecord::Base
    has_one :rgluser
    has_one :fbuser
    has_one :parent
    has_one :mentor
    has_many :groupinv
    
    def self.whois(session)
        session[:user_id] = nil if !session.key?(:expires_at) || session[:expires_at] < Time.current
        session[:user_id] = nil if !session.key?(:user_id)
        session[:user_id] = nil if User.find_by_id(session[:user_id]).nil?
        nil if session[:user_id] == nil
        User.find_by_id(session[:user_id])
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
            if !self.fbuser.nil?
                return self.username
            end
            if self.parent.nil?
                return self.username
            else
                return self.parent.firstname    
            end
        else
            return self.mentor.firstname if !self.mentor.nil?
        end
        return "new user"
    end
end
