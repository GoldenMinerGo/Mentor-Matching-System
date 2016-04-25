class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :parent_id
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.date :date_of_birth
      t.string :school
      t.string :grade
      t.string :time_slot
      t.string :competitions
      t.text :description
      t.boolean :visible
      t.timestamps null: false
      
      t.references :parent
      t.references :group
    end
  end
end
