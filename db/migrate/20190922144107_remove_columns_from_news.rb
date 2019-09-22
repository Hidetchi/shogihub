class RemoveColumnsFromNews < ActiveRecord::Migration
  def change
    remove_column :news, :open
    remove_column :news, :removed
  end
end
