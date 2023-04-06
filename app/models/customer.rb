class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :Favorites
  has_many :comments

  has_one_attached :image

  def get_profile_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
