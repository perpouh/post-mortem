
json.array! @projects do |project|
  json.project do 
    json.merge! project.attributes
    # json.tickets project.tickets 一覧ではいらない気がした
  end
end