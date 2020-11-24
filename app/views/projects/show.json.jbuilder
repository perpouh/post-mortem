json.project do 
  json.merge! @project.attributes
  json.tickets @project.tickets
end