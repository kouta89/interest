class Like < ApplicationRecord

  belongs_to :customer
  has_many :comments
  has_many :favorites, dependent: :destroy

  def favorited?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # 検索方法分岐
  def self.looks(word)
    @like = Like.where("name LIKE?","%#{word}%")
  end

  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
