class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :name
      t.string :url
      t.string :owner
      t.string :description
      t.integer :country_id
      t.integer :language_id
      t.integer :scale, default: 0
      t.integer :frequency, default: 0
      t.boolean :contents_introduction
      t.boolean :contents_news_internal
      t.boolean :contents_news_external
      t.boolean :contents_forum
      t.boolean :contents_lesson
      t.boolean :contents_database
      t.boolean :contents_shop

      t.timestamps
      t.userstamps

      t.index :country_id
      t.index :scale
    end
  end
end
