class ChangeReservationTable < ActiveRecord::Migration
   def self.up
    change_table :reservations do |t|
      t.references :reservationable, :polymorphic => true
    end
  end

  def self.down
    change_table :reservations do |t|
      t.remove_references :reservationable, :polymorphic => true
    end
  end
end
