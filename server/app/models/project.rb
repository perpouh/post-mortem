# プロジェクト
class Project < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :tickets, -> { tickets_only }
  belongs_to :manager, class_name: 'User'

  scope :joining, ->(user_id) { where(id: Member.project_list(user_id).map(&:id)) }

  validates :name, length: { minimum: 1, maximum: 100 }
  # validates :repository_url
  # validates :backlog_url
  # validates :jira_url
  # validates :confluence_url
  # validates :manager_id
  # predecessor プロジェクトの引き継ぎを実装したい
end
