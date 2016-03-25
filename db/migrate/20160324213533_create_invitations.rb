class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :groupId
      t.integer :senderId
      t.integer :receiverId
      t.string :status
      t.timestamps null: false
    end
  end
end
