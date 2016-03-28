class User < ActiveRecord::Base
    has_one :parent
    has_one :mentor
    
    def self.whois(session)
        nil if !session.key?(:id)
        User.find_by_id(session[:id])
    end
end
