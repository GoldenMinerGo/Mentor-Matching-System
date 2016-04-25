class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :time_slot
      t.text :competitions, array: true, default: []
      t.string :str_com
      t.text :description
      t.boolean :visible
      t.timestamps null: false
      t.boolean :completed
      t.boolean :need_mentor
      
      t.references :mentor
      t.references :admin
    end
  end
end
