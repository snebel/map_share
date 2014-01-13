class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
    	t.string :title
    	t.string :city
    	t.float :center_lat
    	t.float :center_lng
    end
  end
end
