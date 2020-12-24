FactoryBot.define do
  factory :project do
    name { 'テストプロジェクト' }
    # sequence(:repository_url) { |n| "https://github.com/#{}/#{}" }
    # sequence(:backlog_url) { |n| "https://#{}.backlog.jp/projects/#{}" }
    manager { FactoryBot.build(:user) }
  end
end
