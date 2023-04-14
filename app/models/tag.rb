class Tag < ApplicationRecord
  has_many :like_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :likes, through: :like_tags
end
