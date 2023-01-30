class Item < ApplicationRecord
  belongs_to :user

  has_many :transactions

  alias owner user

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
