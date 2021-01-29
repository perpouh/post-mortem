json.set! :tickets do
  json.array! @tickets do |ticket|
    json.partial! partial: 'tickets/detail', locals: { ticket: ticket }
    json.comments ticket.comments
  end
end
json.set! :paginator do
  json.partial! partial: 'kaminari/detail', locals: { resource: @tickets }
end