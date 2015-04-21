class ChangeDefaultInClub < ActiveRecord::Migration
  def change
    change_column :clubs, :scale, :integer, :default => 1
    change_column :clubs, :frequency, :integer, :default => 1
  end
end
