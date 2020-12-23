FactoryBot.define do
  factory :user do
    username { "テスト太郎" }
    sequence(:email) { |n| "TEST#{n}@example.co.jp" }
    password { "testuser" }
  end
end
