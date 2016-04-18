class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :entry_id
      t.string :url
      t.datetime :published_at
      t.string :title_ja
      t.string :title_en
      t.text :content_ja
      t.text :content_en
      t.integer :category
      t.boolean :open, default: false

      t.timestamps

      t.index :entry_id
    end
  end
end
