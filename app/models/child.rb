class Child < ActiveRecord::Base
    belongs_to :parent
    belongs_to :group
end
