class AddAncestryToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :ancestry, :string, index: true
  end
end
