FactoryBot.define do
  factory :project do
    name { 'テストプロジェクト' }
    # sequence(:repository_url) { |n| "https://github.com/#{}/#{}" }
    # sequence(:backlog_url) { |n| "https://#{}.backlog.jp/projects/#{}" }
    manager { FactoryBot.build(:user) }
    trait :with_tickets do
      after(:create) do |project|
        project.tickets << FactoryBot.create(:ticket, body: "チケットA")
        project.tickets << FactoryBot.create(:ticket, body: "チケットB")
        project.tickets << FactoryBot.create(:ticket, body: "チケットC")
      end
    end
  end
end
