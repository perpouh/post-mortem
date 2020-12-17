class Project < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :tickets, -> { tickets_only }

  scope :joining, ->(user_id){
    where(id: Member.project_list(user_id).map{|v|v.id})
  }
end