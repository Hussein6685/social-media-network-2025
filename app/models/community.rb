class Community < ApplicationRecord
  has_one_attached :image
  has_many :community_users
  has_many :users,  through: :community_users
  has_many :posts
end
