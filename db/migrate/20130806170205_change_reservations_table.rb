class ChangeReservationsTable < ActiveRecord::Migration
  def change
    remove_column :reservations, :user
    remove_column :reservations, :restaurant
    remove_column :reservations, :reservationable_id
    remove_column :reservations, :reservationable_type
  end
end
