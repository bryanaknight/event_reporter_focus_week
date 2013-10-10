gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test  
  attr_reader :queue

  def setup
    @queue = Queue.new
  end

  def test_it_counts
    assert_equal 0, queue.count
  end

  def test_it_holds_data
    queue.add([1,2,3])
    assert_equal 3, queue.count
  end

  def test_it_adds_data_to_existing_data
    queue.add([1,2,3])
    queue.add([4,5,6])
    assert_equal 6, queue.count
  end

  def test_it_clears_itself
    queue.add([1,2])
    assert_equal 2, queue.count
    queue.clear
    assert_equal 0, queue.count
  end

  def test_it_replaces_the_data
    queue.add([1,2])
    queue.replace([3,4,5])
    assert_equal 3, queue.count
  end

end
