class Group < ActiveRecord::Base
    has_many :children
    belongs_to :mentor
    belongs_to :admin, class_name: 'parent'
    has_many :invitations
end
