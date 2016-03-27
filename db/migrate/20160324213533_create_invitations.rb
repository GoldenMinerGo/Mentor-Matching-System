class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :group_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status
      t.timestamps null: false
      
      t.references :sender
      t.references :receiver
      t.references :group
    end
  end
end
