# project_DOM_tree

# Warmup 1

def parse_tag(node_string)

  Node = Struct.new(:tag, :attributes, :parent, :children)

  node_root = Node.new(tag_name, attr_hash, parent, children)

  node_root.children = []

  puts "\nnode_string = #{node_string}\n" 

  node_array = node_string.scan(/<.+>.split(" ")/)
  puts "\nnode_array = #{node_array}\n" 
  node_array.each_with_index do |i, element|   # format correct?
    if i == 0
      node_root.tag = element
    else
      attribute_key = element.split("=")[0]
      attribute_value = element.split("=")[1][1..-2] # omit quotes
      node_root.attributes[attribute_key] = attribute_value
    end
    puts "node_root.tag = #{node_root.tag}"
    puts "attribute_key = #{attribute_key} ... attribute_value = #{attribute_value}"

  end
  node_root.parent = nil
  node_root.children = [nil]
  puts "node_root = #{node_root}"
  node_root

end

node_string = "<p class='foo bar' id='baz' name='fozzie'>"
parse_tag(node_string)


