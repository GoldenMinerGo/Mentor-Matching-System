class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :parent_id
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.integer :age
      t.string :school
      t.string :grade
      t.string :time_slot
      t.string :competitions, array: true, default: []
      t.text :description
      t.boolean :visible
      t.timestamps null: false
      
      t.references :parent
      t.references :group
    end
  end
end
