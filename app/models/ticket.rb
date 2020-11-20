class Ticket < Opinion
  has_many :comments, foreign_key: "reference_id"
  @table_name = :opinions
end
