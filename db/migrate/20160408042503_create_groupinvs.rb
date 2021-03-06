class CreateGroupinvs < ActiveRecord::Migration
  def change
    create_table :groupinvs do |t|
      t.integer :group_id
      t.integer :mentor_id
      t.boolean :send_by_mentor, default: false
      t.string :status
      t.timestamps null: false
      
      t.references :mentor
      t.references :group
    end
  end
end
