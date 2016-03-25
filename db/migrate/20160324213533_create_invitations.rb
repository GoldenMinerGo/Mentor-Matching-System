class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :group_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status
      t.timestamps null: false
    end
  end
end
