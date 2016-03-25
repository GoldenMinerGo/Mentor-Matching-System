class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :admin_id
      t.integer :mentor_id
      t.integer :children_id, array: true, default: []
      t.string :time_slot
      t.string :competitions, array: true, default: []
      t.text :description
      t.boolean :visible
      t.timestamps null: false
    end
  end
end
