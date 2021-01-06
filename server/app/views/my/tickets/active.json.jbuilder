json.array! @tickets do |ticket|
  json.merge! ticket.attributes
end