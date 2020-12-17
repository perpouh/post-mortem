json.project do 
  json.merge! @project.attributes
  json.tickets @project.tickets
  json.manager @project.manager
  json.members @project.users do |member|
    json.name member.username
  end 
end