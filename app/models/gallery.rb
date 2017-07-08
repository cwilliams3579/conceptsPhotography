class Gallery < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  attr_accessor :image
  validate :image_size
  #serialize :images, JSON # If you use SQLite, add this line.

  private
    def image_size
      if image.size > 10.megabytes
        errors.add(:image, "Should be less than 10MB")
      end
    end
end
