# チケット
class Ticket < Opinion
  has_many :comments, foreign_key: 'reference_id'
  @table_name = :opinions

  validates :body, length: { minimum: 1, maximum: 100 }
end
