class Member < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def name
    user.username
  end
end
