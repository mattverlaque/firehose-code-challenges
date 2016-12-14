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

def floyd(list_node)                # Init method to check for cycle
  hare = list_node                  # Set var hare to first node
  tort = list_node                  # Set var tort to first node
  while hare.next_node != nil       # While loop - run when hare.next isn't nil (not at end)
    hare = hare.next_node             # Move hare one spot forward
    hare = hare.next_node             # Move hare another spot forward
    tort = tort.next_node             # Move tort one spot forward
    if hare == tort                   # Check if they're at the same spot
      return true                     # If so, it's a loop!
    end
  end
  return false                      # If they reach here, the hare is at the end
end                                 # Meaning that it's not a loop.

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

puts floyd(node3)