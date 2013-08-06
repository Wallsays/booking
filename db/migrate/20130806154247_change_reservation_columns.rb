class ChangeReservationColumns < ActiveRecord::Migration
  def change
    remove_column :reservations, :user
    remove_column :reservations, :restaurant
    add_column :reservations, :user, :integer
    add_column :reservations, :restaurant, :integer
  end
end
