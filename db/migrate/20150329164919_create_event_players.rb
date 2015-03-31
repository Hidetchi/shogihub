class CreateEventPlayers < ActiveRecord::Migration
  def change
    create_table :event_players do |t|
      t.references :event, index: true
      t.references :player, index: true
    end
  end
end
