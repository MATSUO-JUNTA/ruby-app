class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes, dependent: :destroy
  has_many :likes_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def followers_count
    followers.count
  end

  def followings_count
    followings.count
  end

  def create_notification(notification_type,notified_by,post)
    notifications.create(
      notification_type: notification_type,
      notified_by: notified_by,
      post: post
    )
  end
end
