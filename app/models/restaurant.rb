class Restaurant < ActiveRecord::Base
  attr_accessible :category, :lat, :lng, :misc, 
                  :name, :owner_id, :price, :budget, :cuisine

  validates :name, :presence => true
  validates :lng,   :presence => true
  validates :lat,   :presence => true
  validates :price,   :presence => true
  validates :budget,   :presence => true
  validates :cuisine,   :presence => true
  validates :price, :numericality => { 
                :greater_than_or_equal_to => 1, 
                :less_than_or_equal_to => 5  }

  has_many :reservations
  has_many :inventories
  has_many :inventory_templates

  belongs_to :owner

  # scope :with_cuisine, -> (cuisine) do 
  #   where('cuisine LIKE ?', "%#{cuisine}%" ) unless cuisine.present?
  # end

  #todo: refactor
  class << self
    def with_price price
      if price.class == Array
        case price.length
          when 2..5
            where("price >= ? AND price <= ?", price[0].to_i, price.last.to_i)
          else
            where(price: price[0])
        end
      else
        where(price: price)
      end
    end

    def with_cuisine cuisine
      if cuisine.class == Array
        case cuisine.length
          when 2
            where('cuisine LIKE ? or cuisine LIKE ?', "%#{cuisine[0]}%", "%#{cuisine[1]}%")
          when 3
            where('cuisine LIKE ? or cuisine LIKE ? or cuisine LIKE ?', "%#{cuisine[0]}%", "%#{cuisine[1]}%", "%#{cuisine[2]}%")
          else
            where('cuisine LIKE ?', "%#{cuisine[0]}%")
        end
      else
        where('cuisine LIKE ?', "%#{cuisine}%")
      end
    end

    def with_location location
      where('location LIKE ?', "%#{location}%")
    end
  end


end

   