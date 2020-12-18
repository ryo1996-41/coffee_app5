class User < ApplicationRecord
   has_secure_password

   validates :name,{presence: true,on: :create}
   validates :email,{presence: true,on: :create}
   validates :password,{presence: true,on: :create}

   has_one_attached :avatar

   has_many :posts,:dependent=> :destroy

# ====================自分がフォローしているユーザーとの関連 =============
   has_many :active_relationships,class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
   has_many :following, through: :active_relationships, source: :followed

# ====================自分がフォローされるユーザーとの関連 ===============   
   has_many :passive_relationships,class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
   has_many :followers, through: :passive_relationships, source: :follower



    # ユーザーをフォローする
      def follow(other_user)
        following << other_user
      end

      # ユーザーをフォロー解除する
      def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
      end

      # 現在のユーザーがフォローしてたらtrueを返す
      def following?(other_user)
        following.include?(other_user)
      end
end
