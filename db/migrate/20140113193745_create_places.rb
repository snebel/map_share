class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.string :address
      t.float :lat
      t.float :lng
      t.string :link
      t.text :description
    end
  end
end
