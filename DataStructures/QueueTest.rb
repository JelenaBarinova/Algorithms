
require_relative "Queue"
require "test/unit"


class TestQueue < Test::Unit::TestCase
 
  def setup
    @queue = Queue.new()
  end
# test Queue.toString()
  def test_new_returns_true_when_queue_created
    
    assert_equal(true, !@queue.nil?)
  end

# test Queue.size()
  def test_size_returns_0_when_queue_just_created
    
    assert_equal(0, @queue.size())
  end
  def test_size_returns_4_when_4_nodes_added
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.enqueue("C")
    @queue.enqueue("D")     
    
    assert_equal(4, @queue.size())
  end
  # test Queue.toString()
  def test_dequeue_0_when_queue_just_created
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.enqueue("C")
    @queue.enqueue("D") 
    @queue.dequeue()
  
    assert_equal(3, @queue.size())
  end
    def test_dequeue_returns_nil_when_empty_queue
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.dequeue()
    @queue.dequeue()

    assert_equal(nil, @queue.dequeue())
  end
end