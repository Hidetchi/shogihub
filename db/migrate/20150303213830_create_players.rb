class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :search_key
      t.integer :category, :default => 0
      t.integer :kishi_id
      t.integer :teacher_id
      t.integer :rank
      t.date :birthday
      t.string :url

      t.timestamps

      t.index :search_key
    end
  end
end
