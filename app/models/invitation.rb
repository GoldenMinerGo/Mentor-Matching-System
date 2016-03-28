class Invitation < ActiveRecord::Base
    # belongs_to :sender, class_name: 'child'
    # belongs_to :receiver, class_name: 'child'
    belongs_to :group
    belongs_to :sender, class_name: "Child", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "Child", foreign_key: "receiver_id"
end
