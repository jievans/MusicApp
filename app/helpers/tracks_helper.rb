module TracksHelper
  def ugly_lyrics(lyrics)
    lines_array = lyrics.split("\n")
    lines_array.map!{ |line| "&#9835;" << h(line) }
    new_lyrics = lines_array.join("\n")
    "<pre>#{new_lyrics}</pre>".html_safe
  end

end
