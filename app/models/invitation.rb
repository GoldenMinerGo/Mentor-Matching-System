class Invitation < ActiveRecord::Base
    belongs_to :sender, class_name: 'child'
    belongs_to :receiver, class_name: 'child'
    belongs_to :group
end
