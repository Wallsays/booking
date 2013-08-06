class AddLatAndLngColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :decimal, :precision => 15, :scale => 10
    add_column :restaurants, :lng, :decimal, :precision => 15, :scale => 10
  end
end
