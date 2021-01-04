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
  end
end
