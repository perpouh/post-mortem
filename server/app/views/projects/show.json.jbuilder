json.project do
  json.merge! @project.attributes
  json.tickets @project.tickets do |ticket|
    json.partial! partial: 'tickets/detail', locals: { ticket: ticket }
  end
  json.manager @project.manager
  json.members @project.users do |member|
    json.name member.username
  end
end