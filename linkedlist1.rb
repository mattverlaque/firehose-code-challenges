class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :data

  def initialize
    @data = nil
  end

  #push value onto stack
  def push(value)                                   # Accept numerical value
    @data = LinkedListNode.new(value, @data)        # Set @data to new value, and @data.next_node as the previous version of @data
  end

  #pop value off of stack
  def pop
    if @data == nil                                 # Don't mess up if nil
      #puts "Stack is empty!"
      return nil
    else
      value = @data.value                           # Set value to the numerical value
      @data = @data.next_node                       # Set @data to the next one down in the stack
      value                                         # Return the numerical value
    end
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

def reverse_list(list)                              # Method to reverse the list
  stack = Stack.new                                 # Create a new stack
  while list.next_node != nil                       # While loop - next node != nil
    stack.push(list.value)                          # Push the numerical value of the list item onto the stack
    list = list.next_node                           # Set list to the next one down
  end
  if list.next_node == nil                          # Run to get the last value out
    stack.push(list.value)                          # Push the numerical value onto the stack
  end
end

node1 = LinkedListNode.new(37)                      # Create dataset
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(34, node3)
node5 = LinkedListNode.new(27, node4)

print_values(node5)

puts "\n"
rev = reverse_list(node5)
print_values(rev)