json.ticket do 
  json.merge! @ticket.attributes
  json.comments @ticket.comments
end