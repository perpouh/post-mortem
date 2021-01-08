# チケット
class Ticket < Opinion
  belongs_to :project
  has_many :comments, foreign_key: 'reference_id', class_name: 'Comment', dependent: :destroy

  scope :created_by, ->(user) { where(user_id: user.id) }

  scope :in_joining_project, ->(user) { where(project_id: Project.joining(user.id).map(&:id)) }

  scope :active, -> { eager_load(:comments).order('comments_opinions.updated_at desc') }

  def title
    body.split("\n").first
  end
end
