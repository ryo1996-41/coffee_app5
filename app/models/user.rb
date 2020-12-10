class User < ApplicationRecord
   has_secure_password

   validates :name,{presence: true,on: :create}
   validates :email,{presence: true,on: :create}
   validates :password,{presence: true,on: :create}

   has_one_attached :avatar

   has_many :posts,:dependent=> :destroy

   # has_many :follower,class_name: "Relationship",foreigh_key: "follower_id",dependent: :destroy
   # has_many :followed,class_name: "Relationship",foreigh_key: "followed_id",dependent: :destroy
   #
   # has_many :following_user, through: :follower, source: :followed
   # has_many :follower_user, through: :followed, source: :follower



  # ユーザーをフォローする
  # def follow(user_id)
  #   follower.create(followed_id: user_id)
  # end

  # ユーザーのフォローを外す
  # def unfollow(user_id)
  #   follower.find_by(followed_id: user_id).destroy
  # end

  # フォローしていればtrueを返す
  # def following?(user)
  #   following_user.include?(user)
  # end

end
