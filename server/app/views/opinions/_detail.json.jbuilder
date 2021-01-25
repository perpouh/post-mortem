json.id opinion.id
json.project_id opinion.project_id
json.title opinion.title if opinion.ticket?
json.body opinion.body
json.liked opinion.liked
json.opinion_type opinion.opinion_type
json.updated_at opinion.updated_at.strftime('%Y/%m/%d %H:%M')
json.commented opinion.comments.count if opinion.ticket?
json.project_name opinion.project.name