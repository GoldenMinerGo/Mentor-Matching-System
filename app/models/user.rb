class User < ActiveRecord::Base
    has_one :parent
    has_one :mentor
end
