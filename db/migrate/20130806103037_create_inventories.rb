class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :restaurant
      t.date :date
      t.time :time
      t.integer :quantity_available

      t.timestamps
    end
  end
end
