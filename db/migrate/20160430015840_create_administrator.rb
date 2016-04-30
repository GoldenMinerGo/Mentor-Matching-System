class CreateAdministrator < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :name
      
      t.references :user
    end
  end
end
