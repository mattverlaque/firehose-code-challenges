class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, previous=nil)      # Init method for reversal (eg 1, 2, 3)
  current = list.next_node                # Current = 2
  list.next_node = previous               # 1.next_node = nil
  if current != nil                       # If not at the end of the line, then...
    reverse_list(current, list)           # reverse_list(2, 1)
  else                                    # current = 3 | 2.next_node = 1 | Keep going
    list                                  # Return list when you reach the end
  end
end

node1 = LinkedListNode.new(37)            # Create dataset
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(34, node3)
node5 = LinkedListNode.new(27, node4)

print_values(node5)

puts "-----"

rev = reverse_list(node5)
print_values(rev)