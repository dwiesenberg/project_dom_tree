# project_DOM_tree

# Warmup 1

def parse_tag(node_string)



  tag = ""
  children = []
  attributes = {}

  puts "\nnode_string = #{node_string}\n" 

  node_array = node_string.match(/<.+>/).to_s.split(" ")
  puts "\nnode_array = #{node_array}\n" 
  node_array.each_with_index do |element, index|   
    if index == 0
      tag = element[1]
      puts "tag = #{tag}"
    else
      attribute_key = element.split("=")[0]
      attribute_value = element.split("=")[1] # omit quotes
      attributes[:attribute_key] = attribute_value
    end
    puts "attribute_key = #{:attribute_key} ... attribute_value = #{attribute_value}"
  end
  parent = nil
  children = [nil]

  node_root = Node.new(tag, attributes, parent, children)

  puts "node_root = #{node_root}"
  node_root

end

Node = Struct.new(:type, :attributes, :text, :parent, :children)
  # :attributes is hash
new_node = Node.new(....)
current_node.children.push(new_node)


node_string = "<p class='foo bar'>text0<div class='xxx' id='baz'>text1</div>text3</p>" 

/.*</



x = <p class='foo bar' id='yyy'>

class='foo bar'

t = [class, 'foo bar']

key = t[0]

value = t[1][1..-2]

value = 'foo bar'

value[1..-2]

/<.+>/ ... find first tag expr ... store it and analyze

/.+/s)/ ... find first item (tag name) (ends with space) and analyze

  /.+=/ ... find key (remove = when storing in Struct)
  /'.*'/ ... find value (remove quotes when storing in Struct)

where store text? ... make part of hash? 
/.*</ ... detect text if any (delete < when storing in Struct) 

repeat process for rest of tags ... ignore closing tags </xxx>



