class UserPoint < ApplicationRecord
  belongs_to :user

  validates :point, numericality: { greater_than_or_equal_to: 0 }

  # @param usage [Integer]
  def spend(usage)
    self.point = point - usage
    self.save!
  end
end
