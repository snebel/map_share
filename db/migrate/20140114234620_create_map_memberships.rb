class CreateMapMemberships < ActiveRecord::Migration
  def change
    create_table :map_memberships do |t|
      t.integer :map_id
      t.integer :place_id
    end
  end
end
