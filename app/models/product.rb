class Product < ActiveRecord::Base

	belongs_to :ware_house

	validates :sku_code, :presence => true,
            :uniqueness => true,
            length: {minimum: 8, maximum: 8}
end
