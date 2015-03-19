class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :code
      t.boolean :enabled
      t.integer :region_id

      t.index :enabled
      t.index :region_id
    end
  end
end
