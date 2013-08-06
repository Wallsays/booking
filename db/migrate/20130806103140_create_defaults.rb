class CreateDefaults < ActiveRecord::Migration
  def change
    create_table :defaults do |t|
      t.references :restaurant
      t.string :name
      t.time :time
      t.integer :quantity_available
      t.boolean :primary

      t.timestamps
    end
  end
end
