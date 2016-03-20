class WishImage < ActiveRecord::Base
  # belongs_to :wish
  mount_uploader :image, ImageUploader
end
