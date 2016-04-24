class AddRemovedToNews < ActiveRecord::Migration
  def change
    add_column :news, :removed, :boolean, :default => false
  end
end
