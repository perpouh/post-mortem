# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

manager = User.find_or_create_by({email: 'manager@example.com'}) do |u|
   u.password = 'password'
   u.username = 'manager'
   u.nickname = 'erai'
end
manager.confirm
user = User.find_or_create_by({email: 'test@example.com'}) do |u|
   u.password = 'password'
   u.username = 'testuser'
   u.nickname = 'testy'
end
user.confirm

project = Project.find_or_create_by({name: 'プロジェクトA'}) do |p|
  p.manager_id = manager.id
end
project.members.find_or_create_by!({user_id: user.id})

project.tickets.create({body: "Keep", opinion_type: 1, user_id: manager.id, project_id: project.id})
ticket = project.tickets.create({body: "Problem", opinion_type: 2, user_id: manager.id, project_id: project.id})
ticket.comments.create({body: "@testuser 参加してるプロジェクトのテストコメント", opinion_type: 4, user_id: manager.id, project_id: project.id})
project.tickets.create({body: "Try @testuser", opinion_type: 3, user_id: manager.id, project_id: project.id})

Rails.logger.debug '目印'
project.tickets.each{|v|Rails.logger.debug v.errors.to_json}

project = Project.find_or_create_by({name: 'プロジェクトB'}) do |p|
  p.manager_id = manager.id
end

project.tickets.create({body: "Keep", opinion_type: 1, user_id: manager.id, project_id: project.id})
ticket = project.tickets.create({body: "Problem", opinion_type: 2, user_id: manager.id, project_id: project.id})
ticket.comments.create({body: "@testuser 参加していないプロジェクトのテストコメント", opinion_type: 4, user_id: manager.id, project_id: project.id})
project.tickets.create({body: "Try @testuser", opinion_type: 3, user_id: manager.id, project_id: project.id})