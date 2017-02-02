# project_DOM_tree

# ParseTag

require 'pry'

module ParseBuildNodes
  class ParseTag

    attr_accessor 
      # how give access to @current_node from class ParseHTML?

    Node = Struct.new(:type, :attributes, :level, :parent, :children)

    def initialize
      @node_stack = []
      @level = -1
    end

    def parse_get_data
      loop do 
        binding.pry
        puts "Enter data: (Q to quit)"
        tag = gets.chomp
        exit if tag == "Q"
        parse_tag(tag)
      end

    end



    def parse_tag(tag)
      binding.pry
      puts ""
      @tag = tag
      puts "\n\n in parse_tag ... tag = #{tag} ... @level = #{@level}"
#      puts "@current_node = #{@current_node}"
      if tag.match(/<.+>/m)
        get_type
        get_attributes
      else
        get_text
      end
      create_node
    end


    def get_type
      binding.pry
      extract = @tag.match(/(<(.+?))[\s|>]/)
      @type = extract[2].to_s # get type
      @tag.slice!(extract[1].to_s)
    end

    def get_attributes
      binding.pry     
      @attributes = {} # name: value
      until @tag == ">" #  get attributes
        extract = @tag.match(/\s?(.+?)\s?=\s?('.*?')/)
        puts "extract = #{extract}"
        attribute_key = extract[1].to_sym
        attribute_value = extract[2]
        @attributes[attribute_key] = attribute_value
        @tag.slice!(extract.to_s)
      end
    end

    def get_text
      binding.pry
      @type = "text"
      @attributes[:text] = @tag
    end

    def create_node
      binding.pry
      @level += 1 unless @type == "text"
#      puts "\n\nin create_node ... @current_node = #{@current_node} .. before tag_node created"
      tag_node = Node.new(@type, @attributes, @level, @current_node, children=[])
      puts "\n\ntag_node = #{tag_node}"
#      puts "@current_node = #{@current_node}"
      @current_node.children.push(tag_node) unless @level == 0 
        # no prior @current_node at root level
#      puts "@current_node = #{@current_node} ... after updating children"
      @current_node = tag_node unless @type == "text"
      @root_node = @current_node if @level == 0 
        # set for examination and rendering later
#      puts "@current_node = #{@current_node} ... should be set to tag_node"
      @node_stack << @current_node
#      puts "node_stack = #{@node_stack}"
      @current_node
    end

    def get_parent
      return if @level == 0 # root node has no parent
#      puts "in get_parent ... node_stack = #{@node_stack}"
#      puts "current_node = #{@current_node}"
      @node_stack.pop
      exit if @node_stack.empty?
      @level -= 1
      @current_node = @current_node.parent

    end

    def render_nodes
      puts "\n\nNODE LIST"
      puts "---------"
      @node_stack.each do |node| 
        puts "\n", "node.type = #{node.type}"
        puts "node.attributes = #{node.attributes}"
        puts "node.level = #{node.level}"
#        puts "node.children = #{node.children.type}, #{node.children.attributes}" unless node.children == []
      end
    end

  end # class ParseTag

end # module ParseBuildNodes







