class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :role
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.datetime :last_login_time
      t.timestamps null: false
    end
  end
end
