class AddRetiredDeceasedToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :retired, :boolean, :default => false
    add_column :players, :deceased, :boolean, :default => false
  end
end
