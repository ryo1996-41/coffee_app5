class Post < ApplicationRecord

  has_one_attached :image
  has_many :likes
  belongs_to :user

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
