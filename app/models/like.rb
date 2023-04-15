class Like < ApplicationRecord

  belongs_to :customer
  has_many :comments
  has_many :favorites, dependent: :destroy

  # タグ
  has_many :like_tags,dependent: :destroy
  has_many :tags,through: :like_tags

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_like_tag = Tag.find_or_create_by(name: new)
      self.tags << new_like_tag
    end
  end

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
