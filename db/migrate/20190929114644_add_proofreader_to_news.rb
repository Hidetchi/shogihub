class AddProofreaderToNews < ActiveRecord::Migration
  def change
    add_column :news, :proofreader_id, :integer, index: true
  end
end
