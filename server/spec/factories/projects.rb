FactoryBot.define do
  factory :project do
    name { 'テストプロジェクト' }
    # sequence(:repository_url) { |n| "https://github.com/#{}/#{}" }
    # sequence(:backlog_url) { |n| "https://#{}.backlog.jp/projects/#{}" }
    manager { FactoryBot.build(:user) }
    trait :with_tickets do
      after(:create) do |project|
        project.tickets << FactoryBot.create(:newticket, body: "チケットA", project: project)
        project.tickets << FactoryBot.create(:newticket, body: "チケットB", project: project)
        project.tickets << FactoryBot.create(:newticket, body: "チケットC", project: project)
      end
    end
  end
  factory :project_a, class: Project do
    name { '参加しているプロジェクト' }
    manager { FactoryBot.build(:user) }
    trait :with_tickets do
      after(:create) do |project|
        project.tickets << FactoryBot.create(:newticket, body: "チケットA", project: project)
        project.tickets << FactoryBot.create(:newticket, body: "@username チケットB", project: project)
        project.tickets << FactoryBot.create(:newticket, body: "チケットC", project: project)
      end
    end
  end
  factory :project_b, class: Project do
    name { '参加していないプロジェクト' }
    manager { FactoryBot.build(:user) }
    trait :with_tickets do
      after(:create) do |project|
        project.tickets << FactoryBot.create(:newticket, body: "チケットA", project: project)
        project.tickets << FactoryBot.create(:newticket, body: "チケットB @username", project: project)
        project.tickets << FactoryBot.create(:newticket, body: "チケットC", project: project)
      end
    end
  end
end
