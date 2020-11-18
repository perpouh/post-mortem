class Project < ApplicationRecord
  has_many :members
  has_many :tickets
end
