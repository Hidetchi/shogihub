class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :country_id
      t.string :venue
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :organizer
      t.string :url
      t.string :report_url
      t.string :contact
      t.text :description
      t.integer :category, default: 0
      t.boolean :canceled, default: false
      t.integer :scale, default: 0

      t.timestamps
      t.userstamps

      t.index :country_id
      t.index :start_time
    end
  end
end
