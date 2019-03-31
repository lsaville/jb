require_relative './node'
require 'pry'

class LinkedList
  attr_reader :head

  def append(node_data)
    if @head
      node = @head

      until node.next_node == nil
        node = node.next_node
      end

      node.next_node = Node.new(node_data)
    else
      @head = Node.new(node_data)
    end
  end

  def count
    count = 1

    node = @head

    until node.next_node == nil
      count += 1
      node = node.next_node
    end

    count
  end

  def to_string
    if @head
      node = @head
      node_strings = [node.data]

      until node.next_node == nil
        node = node.next_node
        node_strings << node.data
      end

      node_strings.join(' ')
    else
      nil
    end
  end

  def prepend(node_data)
    new_head = Node.new(node_data)
    new_head.next_node = @head
    @head = new_head
  end

  def insert(index, node_data)
    return 'use prepend for beginning of list' if index == 0

    node = @head
    (index - 1).times do
      node = node.next_node
    end

    new_node           = Node.new(node_data)
    new_node.next_node = node.next_node
    node.next_node     = new_node
    new_node.data
  end

  def find(index, element_num)
    node = @head

    index.times do
      node = node.next_node
    end

    node_strings = [node.data]

    (element_num - 1).times do
      node = node.next_node
      node_strings << node.data
    end
    
    node_strings.join(' ')
  end

  def includes?(node_search_data)
    included = false

    node = @head

    while node.next_node != nil
      puts "in the while #{node.data}"
      if node.data == node_search_data
        return true
      else
        node = node.next_node
      end
    end

    included
  end

  def pop
    node = @head

    while node.next_node.next_node != nil
      node = node.next_node
    end

    node_deletion = node.next_node
    node.next_node = nil

    node_deletion.data
  end
end
