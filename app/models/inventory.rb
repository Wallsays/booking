class Inventory < ActiveRecord::Base
  attr_accessible :date, :quantity_available, 
                  :start_time, :end_time, :restaurant_id

  validates :restaurant_id, :presence => true
  validates :date,          :presence => true
  validates :start_time,    :presence => true
  validates :end_time,      :presence => true
  validates :quantity_available, :presence => true,
            :numericality => { :greater_than_or_equal_to => 1 }

  belongs_to :restaurant

end
