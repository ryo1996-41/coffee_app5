class User < ApplicationRecord
   has_secure_password

   validates :name,{presence: true}
   validates :email,{presence: true}
   validates :password,{presence: true}


   has_one_attached :avatar

   has_many :posts,:dependent=> :destroy

end
