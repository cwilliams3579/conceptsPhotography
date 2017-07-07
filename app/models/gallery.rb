class Gallery < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validate :image_size
  #serialize :images, JSON # If you use SQLite, add this line.

  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "Should be less than 5MB")
      end
    end
end
