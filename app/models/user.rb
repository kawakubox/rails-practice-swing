class User < ApplicationRecord
  has_one :user_point

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
