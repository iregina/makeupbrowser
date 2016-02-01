class Product < ActiveRecord::Base
  	has_many :product_photos, class_name: ProductPhoto
	has_many :photos, through: :product_photos


  validates :name, presence: true
end
