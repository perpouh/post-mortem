json.ticket do 
  json.merge! @ticket.attributes
  json.comments @ticket.comments do |comment|
    json.merge! comment.attributes
    json.user comment.user
  end
end