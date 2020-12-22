# コメントはチケットに紐づく
class Comment < Opinion
  belongs_to :ticket, foreign_key: 'reference_id'
  belongs_to :user

  @table_name = :opinions
end
