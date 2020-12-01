class User < ApplicationRecord
   has_secure_password

   validates :name,{presence: true,on: :create}
   validates :email,{presence: true,on: :create}
   validates :password,{presence: true,on: :create}


   has_one_attached :avatar

   has_many :posts,:dependent=> :destroy

end
