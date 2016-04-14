class User < ActiveRecord::Base
    has_one :rgluser
    has_one :fbuser
    has_one :parent
    has_one :mentor
    
    def self.whois(session)
        session[:user_id] = nil if !session.key?(:expires_at) || session[:expires_at] < Time.current
        nil if !session.key?(:user_id)
        User.find_by_id(session[:user_id])
    end
end
