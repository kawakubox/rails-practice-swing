FactoryBot.define do
  factory :transaction do
    item
    buyer { create(:user) }
    item_name { item.name }
    item_price { item.price }
  end
end
