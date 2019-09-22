class AddStatusToNews < ActiveRecord::Migration
  def change
    add_column :news, :instruction, :integer, limit:1, default:0
    add_column :news, :status, :integer, limit:1, default:0
    add_column :news, :translator_id, :integer, index: true
  end
end
