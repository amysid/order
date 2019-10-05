class Order < ApplicationRecord

	mount_uploader :image , ImageUploader
   	mount_uploader :file, FileUploader

	belongs_to :product
	belongs_to :user

end
