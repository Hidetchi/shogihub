class AddIndexToNews < ActiveRecord::Migration
  def change
    add_index :news, :published_at
  end
end
