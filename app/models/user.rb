class User < ApplicationRecord
  has_many :posts

  authenticates_with_sorcery!

  has_many :posts
  
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
end
