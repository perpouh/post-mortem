json.array! @tickets do |ticket|
  json.merge! ticket.attributes
  json.comments ticket.comments
end