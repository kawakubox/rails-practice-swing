FactoryBot.define do
  factory :user do
    nickname { 'nickname' }
    email { 'hoge@example.com' }
    password { 'passw0rd' }
  end
end
