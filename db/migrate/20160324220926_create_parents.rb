class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :username
      t.string :password
      t.string :role
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.timestamps null: false
    end
  end
end
