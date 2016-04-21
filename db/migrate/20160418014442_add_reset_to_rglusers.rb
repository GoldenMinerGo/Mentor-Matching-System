class AddResetToRglusers < ActiveRecord::Migration
  def change
    add_column :rglusers, :reset_digest, :string
    add_column :rglusers, :reset_token, :string
    add_column :rglusers, :reset_sent_at, :datetime
  end
end
