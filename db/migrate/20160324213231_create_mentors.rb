class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.integer :user_id
      t.string :gender
      t.integer :age
      t.string :school
      t.string :grade
      t.string :time_slot
      t.string :competitions, array: true, default: []
      t.text :description
      t.boolean :visible
      t.timestamps null: false
    end
  end
end
