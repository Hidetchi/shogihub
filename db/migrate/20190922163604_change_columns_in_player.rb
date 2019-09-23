class ChangeColumnsInPlayer < ActiveRecord::Migration
  def change
    add_column :players, :alias_id, :integer
    remove_column :players, :teacher_id, :integer
    remove_column :players, :url, :string
    remove_column :players, :image_url, :string
  end
end
