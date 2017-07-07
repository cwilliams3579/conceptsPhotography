class Gallery < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  #serialize :images, JSON # If you use SQLite, add this line.
end
