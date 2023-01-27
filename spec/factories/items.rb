FactoryBot.define do
  factory :item do
    user
    name { '商品名' }
    price { 5_000 }
  end
end
