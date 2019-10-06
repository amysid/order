class Image < ApplicationRecord
 	mount_uploader :file, ImageUploader
	
	#====================Associations====================
	belongs_to :imagable, polymorphic: true, optional: true
end
