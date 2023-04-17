class Relationship < ApplicationRecord
  belongs_to :follower, class_name:"Customer"
  belongs_to :followed, class_name:"Customer"

  has_many :likes
end
