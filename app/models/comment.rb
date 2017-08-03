class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { in: 4..140 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
