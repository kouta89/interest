class LikeTag < ApplicationRecord
  belongs_to :like
  belongs_to :tag

  validates :like_id, presence: true
  validates :tag_id, presence: true
end
