class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, 
				# :url => "/public/uploads/:style/:filename",
				# :path => ":rails_root/public/uploads/:style/:filename",
				:styles => { :medium => "300x300>", :thumb => "100x100>" }
	# validates :image, presence: true
	# validates :description, presence: true
	# validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
