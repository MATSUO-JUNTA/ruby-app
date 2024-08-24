class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likes_users, through: :likes, source: :user

  validates :title, presence: true
  validates :body,  presence: true
end
