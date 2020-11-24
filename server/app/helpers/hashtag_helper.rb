module HashtagHelper
  def hash_to_link(str)
    str.gsub!(/(#(\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z0-9_])+)/) do |m|
      if /^#\d*$/.match?(m)
        ref = Opinion.find(m.delete('#'))
        if ref.ticket?
          '<a href="'+ project_ticket_path({project_id: ref.project_id, id: ref.id}) +'" class="hashtag">'+m+'</a>'
        else
          '<a href="'+ project_ticket_comment_path({project_id: ref.project_id, ticket_id: ref.reference_id, id: ref.id}) +'" class="hashtag">'+m+'</a>'
        end
      else
        '<a href="/tags/'+m.delete('#')+'" class="hashtag">'+m+'</a>'
      end
    end
    simple_format(str)
  end
end