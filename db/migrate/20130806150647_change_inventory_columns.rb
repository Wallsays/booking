class ChangeInventoryColumns < ActiveRecord::Migration
  def change
    rename_column :inventories, :time, :start_time
    add_column :inventories, :end_time, :time
  end
end
