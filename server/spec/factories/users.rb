FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "tarou" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 'testuser' }
  end
end
