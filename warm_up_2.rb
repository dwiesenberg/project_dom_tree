# project_DOM_tree

# Warmup 2  ... TODO

def parse_tag(node_string)

  Node = Struct.new(:tag, :attributes, :parent, :children)

  children = []
  attributes = {}

  puts "\nnode_string = #{node_string}\n" 

  node_array = node_string.scan(/<.+>.split(" ")/)
  puts "\nnode_array = #{node_array}\n" 
  node_array.each_with_index do |i, element|   # format correct?
    if i == 0
      tag = element
    else
      attribute_key = element.split("=")[0]
      attribute_value = element.split("=")[1][1..-2] # omit quotes
      attributes[attribute_key] = attribute_value
    end
    puts "tag = #{tag}"
    puts "attribute_key = #{attribute_key} ... attribute_value = #{attribute_value}"
  end
  parent = nil
  children = [nil]

  node_root = Node.new(tag, attributes, parent, children)

  puts "node_root = #{node_root}"
  node_root

end

node_string = "<p class='foo bar' id='baz' name='fozzie'>"
parse_tag(node_string)


