class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  attr_accessible :image
end
