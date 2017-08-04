class Gallery < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  mount_uploaders :images, ImageUploader
  validate :image_size
  serialize :images#, JSON # If you use SQLite, add this line.

  private
    def image_size
      if images.size > 5.megabytes
        errors.add(:images, "Should be less than 5MB")
      end
    end
  default_scope -> { order(updated_at: :desc) }
end
