class User < ActiveRecord::Base
    attr_accessible :username , :password
    
    has_one :parent
    has_one :mentor
end
