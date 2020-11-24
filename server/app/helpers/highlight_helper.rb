module HighlightHelper
  def focus(str, words)
    length = 100 # 他の画面でも使うならどっかに出したほうがいいかもしれない

    each_length = length / words.length

    paragraphs = words.map{ | word |
      length_around = (each_length - word.length) / 2
      str.gsub!(/\s/, '')
      m = str.match(/#{word}/)
      pos = m.begin(0)
      forward = m.pre_match[pos - length_around, length_around]
      backword = m.post_match[0, length_around]
      paragraph = forward + "<span class='highlight'>" + m[0] + "</span>" + backword
      {pos: pos, paragraph: paragraph}
    }
    paragraphs.sort_by! { |a| a[:pos] }
    paragraphs.map{ | paragraph | paragraph[:paragraph]}.join('…') + "…" # 変数名がどうにもならない
  end
end