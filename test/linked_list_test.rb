require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'

class TestLinkedList < Minitest::Test
  # iter 1
  def test_that_linked_list_has_head
    list = LinkedList.new

    assert_nil list.head
  end

  def test_linked_list_can_append_node
    list = LinkedList.new
    list.append('doop')

    assert_equal Node, list.head.class
  end

  def test_that_linked_list_can_access_node_data
    list = LinkedList.new
    list.append('doop')

    assert_nil list.head.next_node 
  end

  def test_count
    list = LinkedList.new
    list.append('doop')

    assert_equal 1, list.count
  end

  def test_to_string
    list = LinkedList.new
    list.append('doop')

    assert_equal 'doop', list.to_string
  end

  # iter 2
  def test_can_have_multiple_nodes
    list = LinkedList.new
    list.append('doop')
    list.append('deep')

    assert_equal Node, list.head.next_node.class
    assert_equal 'deep', list.head.next_node.data
  end

  def test_count_handles_multiple_nodes
    list = LinkedList.new
    list.append('doop')
    list.append('deep')

    assert_equal 2, list.count
  end

  def test_to_string_handles_multiple_nodes
    list = LinkedList.new
    list.append('doop')
    list.append('deep')

    assert_equal 'doop deep', list.to_string
  end

  # iter 3
  def test_prepend
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    list.prepend('dop')

    assert_equal 'dop plop suu', list.to_string
    assert_equal 3, list.count
  end

  def test_insert
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    list.prepend('dop')
    return_value = list.insert(1, 'woo')

    assert_equal 'dop woo plop suu', list.to_string
    assert_equal 4, list.count
    assert_equal 'woo', return_value
  end

  # iter 4
  def test_find
    list = LinkedList.new
    list.append('deep')
    list.append('woo')
    list.append('shi')
    list.append('shu')
    list.append('blop')

    assert_equal 'shi', list.find(2, 1)
    assert_equal 'woo shi shu', list.find(1, 3)
  end

  def test_includes
    list = LinkedList.new
    list.append('deep')
    list.append('woo')
    list.append('shi')
    list.append('shu')
    list.append('blop')

    assert list.includes?('deep')
    refute list.includes?('dep')
  end

  def test_pop
    list = LinkedList.new
    list.append('deep')
    list.append('woo')
    list.append('shi')
    list.append('shu')
    list.append('blop')

    assert_equal 'blop', list.pop
    assert_equal 'shu', list.pop
    assert_equal 'deep woo shi', list.to_string
  end
end
