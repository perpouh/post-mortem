FactoryBot.define do
  factory :comment do
    body { 'コメコメコメント' }
    user { FactoryBot.build(:user) }
    opinion_type { :comment }
  end
end
