class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :galleries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
   self.first_name + " " + self.last_name
  end

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :first_name, :last_name, :email, :password, :remember_me, :image, :image_cache, :remove_image

end
