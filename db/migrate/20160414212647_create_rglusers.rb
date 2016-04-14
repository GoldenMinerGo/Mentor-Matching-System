class CreateRglusers < ActiveRecord::Migration
  def change
    create_table :rglusers do |t|
    t.string   :username
    t.string   :password
    t.string   :encrypted_password
    t.string   :role
    t.datetime :last_login_time
    t.string   :salt
    t.timestamps null: false
    
    t.references :user
    end
  end
end
