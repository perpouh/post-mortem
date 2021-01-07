# コメントはチケットに紐づく
class Comment < Opinion
  belongs_to :ticket, class_name: 'Ticket', foreign_key: 'reference_id', optional: true

  belongs_to :user
end
