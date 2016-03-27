class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.timestamps null: false
      
      t.references :user
    end
  end
end
