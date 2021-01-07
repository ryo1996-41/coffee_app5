class Comment < ApplicationRecord

　validates :Content,{presence: true}

  belongs_to :user
  belongs_to :post

end
