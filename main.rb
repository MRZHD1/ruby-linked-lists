class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize(head, tail)
    @head = head
    @tail = tail
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def append(value)
    @tail.next = Node.new(value)
    @tail.next.prev = @tail
    @tail = @tail.next
  end

  def prepend(value)
    @head.prev = Node.new(value)
    @head.prev.next = @head
    @head = @head.prev
  end

  def size
    i = 0
    node = @head
    until node.nil?
      i += 1
      node = node.next
    end
    i
  end

  def at(index)
    i = 0
    node = @head
    until i == index
      node = node.next
      i += 1
    end
    node
  end

  def pop
    @tail = @tail.prev
    @tail.next = nil
  end

  def find(value)
    i = 0
    node = @head
    until node.next.nil?
      i += 1
      if node.value == value
        break
      end
      node = node.next
    end
    node.value == value ? i : nil 
  end

  def to_s
    s = ''
    node = @head
    until node.nil?
      s += "( #{node.value} ) -> "
      node = node.next
    end
    s += 'nil'
    return s
  end

  def contains?(value)
    node = @head
    until node.next.nil?
      if node.value == value
        return true
      end
      node = node.next
    end
    false
  end
end


class Node
  attr_accessor :next
  attr_accessor :prev
  attr_accessor :value

  def initialize(value=nil, nxt=nil)
    @value = value
    @next = nxt
    @prev = nil
  end

  def value
    return @value
  end

  def next
    return @next
  end

  def prev
    return @prev
  end
end



# Tests
node = Node.new(0)
node.next = Node.new(15)
node.next.prev = node
list = LinkedList.new(node, node.next)
list.append(6)
list.prepend(2)
list.append(3)
list.pop
p list.to_s
p list.contains?(15)
p list.contains?(3)
p list.find(15)
