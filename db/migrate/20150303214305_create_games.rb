class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :sente_id
      t.integer :gote_id
      t.integer :tournament_id
      t.string :description
      t.integer :result
      t.date :game_date

      t.timestamps

      t.index :sente_id
      t.index :gote_id
      t.index :tournament_id
      t.index :game_date
    end
  end
end
