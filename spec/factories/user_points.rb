FactoryBot.define do
  factory :user_point do
    user
    point { 10_000 }
  end
end
