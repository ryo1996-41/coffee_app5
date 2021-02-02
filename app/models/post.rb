class Post < ApplicationRecord


  validates :image,{presence: true,on: :create}


  has_one_attached :image
  belongs_to :user
  has_many :likes
  has_many :comments ,:dependent=> :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # 表示用のリサイズ済み画像を返す
  def index_image
    image.variant(resize_to_limit:[600,600])
  end

end
