class Image < ActiveRecord::Base
	belongs_to :user
	belongs_to :occasion
	has_and_belongs_to_many :products

	has_attached_file :image, 
				# :url => "/public/uploads/:style/:filename",
				# :path => ":rails_root/public/uploads/:style/:filename",
				:styles => { :full => "300x300>", :medium => "300x300#", :thumb => "100x100>" }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
	# validates :image, presence: true
	# validates :description, presence: true
	# validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	accepts_nested_attributes_for :occasion

	def self.search(search, page)
	  paginate :per_page => 5, :page => page,
	           :conditions => ['name like ?', "%#{search}%"],
	           :order => 'name'
	end


end
