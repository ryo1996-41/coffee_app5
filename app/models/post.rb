class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :likes
  has_many :comments ,:dependent=> :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
