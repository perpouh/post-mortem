# ハッシュタグを取り出す
module TagExtractor
  extend ActiveSupport::Concern
  def extract_tags(str)
    rejex = /(#(\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z0-9_])+)/
    str.scan(rejex) # => [["#Rails", "s"], ["#101", "1"], ["#hoge", "e"]]
       .map { |v| v[0] } # => ["#Rails", "#101", "#hoge"]
       .reject { |v| /^#\d*$/.match?(v) } # => ["#Rails", "#hoge"]
       .map { |v| v.delete('#') } # => ["Rails", "hoge"]
  end
end