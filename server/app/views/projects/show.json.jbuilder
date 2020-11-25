json.project do 
  json.merge! @project.attributes
  json.tickets @project.tickets
  json.members @project.members do |member|
    json.merge! member.attributes
    json.name member.name
  end 
end