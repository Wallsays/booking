class Restaurant < ActiveRecord::Base
  attr_accessible :category, :lat, :lng, :misc, :name

  validates :name, :presence => true
  validates :lng,   :presence => true
  validates :lat,   :presence => true

  has_many :reservations
  has_many :inventories
  has_many :inventory_templates

end

  