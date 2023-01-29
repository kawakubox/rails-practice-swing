FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }

    after(:create) do |user|
      create(:user_point, user: user)
    end
  end
end
