class Member < ApplicationRecord
  belongs_to :user
  belongs_to :project

  scope :project_list, ->(user_id){
    where(user_id: user_id)
  }
end
