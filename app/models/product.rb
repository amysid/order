class Product < ApplicationRecord
	# mount_uploader :image , ImageUploader
    #====================Associations====================
  	has_one :image, as: :imagable, dependent: :destroy

	has_many :orders, dependent: :destroy
end
