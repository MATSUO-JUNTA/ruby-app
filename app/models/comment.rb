class Comment < ApplicationRecord
  after_create :create_notification

  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 1 }

  def create_notification
    post.user.create_notification('comment',user,post)
  end
end
