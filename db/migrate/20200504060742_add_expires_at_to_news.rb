class AddExpiresAtToNews < ActiveRecord::Migration
  def change
    add_column :news, :expires_at, :datetime
  end
end
