module HashtagHelper
  def tomatosoup(str)
    str.gsub!(/(#(\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z0-9_])+)/){ |match| '<a href="/tags/'+match.delete('#')+'" class="hashtag">'+match+'</a>' }
    simple_format(str)
  end
end