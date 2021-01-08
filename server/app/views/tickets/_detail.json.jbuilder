json.id ticket.id
json.project_id ticket.project_id
json.title ticket.title
json.body ticket.body
json.liked ticket.liked
json.opinion_type ticket.opinion_type
json.updated_at ticket.updated_at.strftime('%Y/%m/%d %H:%M')
json.commented ticket.comments.count