class AddImageUrlToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :image_url, :string
  end
end
