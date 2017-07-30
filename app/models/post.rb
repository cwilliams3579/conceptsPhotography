class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { minimum: 5 }
  validates :title, presence: true, length: { minimum: 5 }
  # validates :image, presence: true
  mount_uploader :image, ImageUploader
end
