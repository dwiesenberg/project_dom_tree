# HtmlCommand

# program collector

require 'pry'
require './html_parse_html'
require './html_parse_tag'

include ParseBuildNodes

class HtmlCommand

  def 

  html =  %{
  <div>
    div text before
    <p>
    p text
    </p>
    <div>
      more div text
    </div>
    div text after
  </div>
  }

  ParseHTML.new.parse_html(html)

end

