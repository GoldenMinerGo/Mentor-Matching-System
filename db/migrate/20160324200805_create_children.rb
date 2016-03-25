class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :parentid
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.integer :age
      t.string :school
      t.string :grade
      t.string :timeslot
      t.string :competitions, array: true, default: []
      t.text :description
      t.boolean :visible
      t.timestamps null: false
    end
  end
end
