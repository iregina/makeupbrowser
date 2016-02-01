class Photo < ActiveRecord::Base
	belongs_to :event

	has_many :product_photos, class_name: ProductPhoto
	has_many :products, through: :product_photos

	validates :name, presence: true
	validates :event_id, presence: true
end
