class Reservation < ActiveRecord::Base
  attr_accessible :restaurant_id, :start_time, :user_id,
                  :active,     :end_time,   :party_size

  validates :restaurant_id, :presence => true
  validates :user_id,       :presence => true
  validates :start_time,    :presence => true
  validates :end_time,      :presence => true
  validates :party_size,    :presence => true
  validates :active,        :presence => true

  belongs_to :user  
  belongs_to :restaurant

end
