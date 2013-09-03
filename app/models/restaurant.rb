class Restaurant < ActiveRecord::Base
  attr_accessible :category, :lat, :lng, :misc, 
                  :name, :owner_id, :price, :budget, :cuisine

  validates :name, :presence => true
  validates :lng,   :presence => true
  validates :lat,   :presence => true
  validates :party_size, :numericality => { 
      :greater_than_or_equal_to => 1, 
      :less_than_or_equal_to => 5  }

  has_many :reservations
  has_many :inventories
  has_many :inventory_templates

  belongs_to :owner
end

  