require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'
require_relative '../lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_it_has_list
    jb = JungleBeat.new

    assert_equal LinkedList, jb.list.class
  end

  def test_list_is_empty
    jb = JungleBeat.new

    assert_nil jb.list.head
  end

  def test_append
    jb = JungleBeat.new

    assert_equal 'deep doo ditt', jb.append('deep doo ditt')
    assert_equal 'deep', jb.list.head.data
    assert_equal 'doo', jb.list.head.next_node.data

    jb.append('woo hoo shu')
  end

  def test_count
    jb = JungleBeat.new

    jb.append('deep doo ditt')
    jb.append('woo hoo shu')

    assert_equal 6, jb.count
  end

  def test_play
    jb = JungleBeat.new

    jb.append('deep doo ditt')
    jb.append('woo hoo shu')

    assert_equal `say -r 500 -v Moira 'deep doo ditt woo hoo shu'`, jb.play
  end
end

