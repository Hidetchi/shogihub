class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.integer :language_id
      t.string :title
      t.string :author
      t.string :publisher
      t.date :issue_date
      t.string :translator
      t.string :url
      t.string :image_url
      t.string :category
      t.string :description
      t.integer :stars, :default => 0

      t.index :language_id
      t.index :issue_date
    end
  end
end
