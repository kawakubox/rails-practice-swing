class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, class_name: 'User'

  validates :item_name, presence: true
  validates :item_price, presence: true
end
