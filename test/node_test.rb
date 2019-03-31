require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'
require 'pry'

class TestNode < Minitest::Test
  def test_node_has_data
    node = Node.new('plop')

    assert_equal 'plop', node.data
  end

  def test_node_has_next_node
    node = Node.new('plop')

    assert_nil node.next_node
  end

  def test_node_has_settable_next_node
    node = Node.new('plop')
    node.next_node = Node.new('ding')

    assert_equal Node, node.next_node.class
    assert_equal 'ding', node.next_node.data
  end
end
