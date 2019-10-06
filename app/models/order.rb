class Order < ApplicationRecord
	mount_uploader :file, ImageUploader
	#====================Associations====================
  	has_one :image, as: :imagable, dependent: :destroy

	belongs_to :product
	belongs_to :user

end
