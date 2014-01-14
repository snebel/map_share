class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :from_user
      t.integer :user_id # user receiving request
      t.integer :map_id
    end
  end
end
