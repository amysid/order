class Order < ApplicationRecord

	mount_uploader :image , ImageUploader
	mount_uploader :file , ImageUploader

	belongs_to :product
	belongs_to :user


end
