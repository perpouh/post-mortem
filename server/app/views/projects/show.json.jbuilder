json.project do 
  json.merge! @project.attributes
  json.tickets @project.tickets
  json.members @project.users do |member|
    json.name member.name
  end 
end