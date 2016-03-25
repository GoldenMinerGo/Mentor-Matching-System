class Dropstuff < ActiveRecord::Migration
  def change
    drop_table :users
  end
end
