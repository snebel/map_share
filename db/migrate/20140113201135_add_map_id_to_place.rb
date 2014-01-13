class AddMapIdToPlace < ActiveRecord::Migration
  def change
    add_column :places, :map_id, :integer
  end
end
