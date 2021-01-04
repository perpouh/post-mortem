# チケット
class Ticket < Opinion
  belongs_to :project
  has_many :comments, foreign_key: 'reference_id'
  @table_name = :opinions

  validates :body, presence: true, length: { minimum: 1, maximum: 100 }

  scope :created_by, ->(user) { where(user_id: user.id) }
end
