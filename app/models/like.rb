class Like < ApplicationRecord

  belongs_to :customer

  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
