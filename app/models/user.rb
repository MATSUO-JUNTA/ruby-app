class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, presence: true, uniqueness: true
  validates :crypted_password, length: { minimum: 6 }, confirmation: true
end
