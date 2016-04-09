class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :gender
      t.date :date_of_birth
      t.string :school
      t.string :grade
      t.string :time_slot
      t.text :competitions, array: true, default: []
      t.text :description
      t.boolean :visible
      t.timestamps null: false
      
      t.references :user
    end
  end
end
