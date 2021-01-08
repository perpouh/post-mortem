json.array! @tickets do |ticket|
  json.partial! partial: 'tickets/detail', locals: { ticket: ticket }
end