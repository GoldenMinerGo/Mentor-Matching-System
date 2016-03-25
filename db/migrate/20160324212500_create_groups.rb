class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :adminId
      t.integer :mentorId
      t.integer :childrenId, array: true, default: []
      t.string :competitions,array: true, default: []
      t.text :description
      t.boolean :visible
      t.timestamps null: false
    end
  end
end
