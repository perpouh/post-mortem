FactoryBot.define do
  factory :ticket do
    project { FactoryBot.build(:project) }
    body { '既存チケット' }
    user { FactoryBot.build(:user) }
    opinion_type { :keep_on }
  end
  factory :newticket, class: Ticket do
    body { '新しいチケット' }
    user { FactoryBot.build(:user) }
    opinion_type { :keep_on }
    trait :with_comments do
      after(:create) do |ticket|
        ticket.comments << FactoryBot.create(:comment, body: "コメントA")
        ticket.comments << FactoryBot.create(:comment, body: "コメントB")
        ticket.comments << FactoryBot.create(:comment, body: "コメントC")
      end
    end
  end
end
