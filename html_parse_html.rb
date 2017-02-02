# project_DOM_tree

# ParseBuildNodes

module ParseBuildNodes

  class ParseHTML

    def initialize
      @parse_tag = ParseTag.new
    end

    def parse_html(html)
      total_lines = html
      until total_lines.chomp.empty? do  
        exit if total_lines.match(/.+\n/) == nil # catches any stray newlines etc.
        tag_raw = total_lines.match(/.+\n/).to_s
        tag = tag_raw.strip() 
        puts "tag = #{tag} ... "
        tag_close?(tag) || tag_new?(tag) || text?(tag)     
        total_lines.slice!(tag_raw)
      end
      @parse_tag.render_nodes
    end

    def tag_close?(tag)
      puts " ... in tag_close?"
      if tag.match(/<\/(.+)>/) # end tag
        extract = tag.match(/<(.+)>/m)
        close_tag_type = extract[1].to_s
    #      puts "end tag ... #{extract}"
    #    raise error "unmatched current and close tag types ((#{@current_node.type}) and (#{close_tag_type}))" unless @current_node.type == close_tag_type

#        @current_node = @current_node.parent

        @parse_tag.get_parent

          # go to parent node
        return true
      end
    end

    def tag_new?(tag)
      puts " ... in tag_new?"
      if tag.match(/<.+>/m) # regular tag, not text
        tag = tag.match(/<.+>/m).to_s

        puts "\n\nin tag_new ... calling parse_tag ... tag = #{tag}"
        @parse_tag.parse_tag(tag)
        return true
      end
    end

    def text?(tag)
      puts " ... in text?"
      @parse_tag.parse_tag(tag) # text, level remains unchanged
    end

  end # class ParseHTML

end # module ParseBuildNodes














