class AddVerbToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :verb, :string
  end
end
