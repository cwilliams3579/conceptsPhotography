class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { minimum: 5 }
  validates :title, presence: true, length: { minimum: 4 }
  # validates :image, presence: true
  mount_uploader :image, ImageUploader
  default_scope -> { order(updated_at: :desc) }
end
