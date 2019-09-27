class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :news, index: true
      t.references :user, index: true
      t.string :anonymous_id, index: true
    end
  end
end
