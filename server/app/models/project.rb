class Project < ApplicationRecord
  has_many :members
  has_many :tickets, -> { tickets_only }
end
