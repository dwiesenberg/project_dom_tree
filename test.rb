# test

require 'pry'

def parse_html(html)
  binding.pry
  total_lines = html
  puts "\nhtml = #{html}"
  until total_lines == "" do  
    tag_raw = total_lines.match(/.+$/m).to_s
    tag = tag_raw.strip() 
    puts "tag = #{tag}"
#    tag_close?(tag) || tag_new?(tag) || text?(tag)     
    total_lines.slice!(tag_raw)
    puts "total_lines = #{total_lines}\n\n"
    puts
  end
end

# #############################

temp =  %{
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

html =  %{
<div>
  div text before
  <p>
</div>
}


parse_html(html)


