class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  paginates_per 2
end
