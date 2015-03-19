class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :flag_code
      t.boolean :enabled

      t.index :enabled
    end
  end
end
