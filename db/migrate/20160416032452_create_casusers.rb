class CreateCasusers < ActiveRecord::Migration
  def change
    create_table :casusers do |t|
      t.string :cas_user_name
      t.timestamps null: false
      
      t.references :user
    end
  end
end
