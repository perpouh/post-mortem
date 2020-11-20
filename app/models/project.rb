class Project < ApplicationRecord
  has_many :members
  has_many :tickets, -> { tickets_only }

  scope :tickets_only, -> { where(opinion_type: [1,2,3]) }
end
