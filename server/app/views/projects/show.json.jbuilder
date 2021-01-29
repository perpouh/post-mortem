json.project do
  json.merge! @project.attributes
  json.tickets @project.tickets do |ticket|
    json.partial! partial: 'tickets/detail', locals: { ticket: ticket }
  end
  json.manager @project.manager
  json.members @project.members do |member|
    json.id member.id
    json.user_id member.user_id
    json.name member.user.username
    json.email member.user.email
  end
end