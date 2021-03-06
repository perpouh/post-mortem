# プロジェクト
class Project < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :tickets, -> { tickets_only }
  belongs_to :manager, class_name: 'User'

  accepts_nested_attributes_for :members

  scope :joining, ->(user_id) { where(id: Member.project_list(user_id).map(&:project_id)) }

  validates :name, length: { minimum: 1, maximum: 100 }, uniqueness: { case_sensitive: false }

  # TODO: カラム精査
  # validates :repository_url
  # validates :backlog_url
  # validates :jira_url
  # validates :confluence_url
  # validates :manager_id

  # TODO: predecessor プロジェクトの引き継ぎを実装したい

  # https://developer.nulab.com/ja/docs/backlog/api/2/get-project-user-list/#
  def assign(users)
    users.each do |user|
      members << Member.new({ user_id: user.id })
    end
  end
end
