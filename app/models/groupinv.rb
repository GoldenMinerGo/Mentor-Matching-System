class Groupinv < ActiveRecord::Base
    belongs_to :group, class_name: "Group", foreign_key: "group_id"
    belongs_to :mentor, class_name: "Mentor", foreign_key: "mentor_id"
end
