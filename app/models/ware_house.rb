class WareHouse < ActiveRecord::Base

  has_many :products

  validates :wh_code, :presence => true,
            :uniqueness => true,
            length: {minimum: 4, maximum: 16}


end
