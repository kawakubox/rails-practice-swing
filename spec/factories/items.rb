FactoryBot.define do
  factory :item do
    user
    name { Faker::Game.title }
    price { Random.rand(1000..5000) }
  end
end
