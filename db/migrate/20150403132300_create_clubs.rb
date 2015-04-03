class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.references :country, index: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :scale
      t.integer :frequency
      t.string :url
      t.string :contact
      t.string :email

      t.timestamps
      t.userstamps
    end
  end
end
