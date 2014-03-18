module HomeHelper

  def auto_link s
    s.gsub! /((http:\/\/|https:\/\/)?(www.)?(([a-zA-Z0-9-]){2,}\.){1,4}([a-zA-Z]){2,6}(\/([a-zA-Z-_\/\.0-9#:?=&;,]*)?)?)/ do |url| 
      "<a href='#{url}'>#{url}</a>"
    end
    sanitize s, tags: %w{a}
  end

end
