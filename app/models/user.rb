class User < ApplicationRecord
  has_one :user_point
  has_many :items
  has_many :transactions, through: :items
  has_many :purchase_histories, class_name: 'Transaction', foreign_key: 'buyer_id'

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_validation :calculate_password_hash

  private

  def calculate_password_hash
    self.password = Digest::SHA256.hexdigest(self.password) if self.password.present?
  end
end
