
#require_relative "Queue"
require_relative "QueueArray"
require "test/unit"

class TestQueue < Test::Unit::TestCase
 
  def setup
    @queue = Queue.new()
  end
# test Queue.new()
  def test_new_returns_true_when_queue_created
    
    assert_equal(true, !@queue.nil?)
  end

# test Queue.size()
  def test_size_returns_0_when_queue_just_created
    
    assert_equal(0, @queue.size())
  end
  def test_iterate_returns_ABCD_when_4_nodes_added
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.enqueue("C")
    @queue.enqueue("D")     

    assert_equal("ABCD", queueToString())
  end

  def test_size_returns_4_when_4_nodes_added
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.enqueue("C")
    @queue.enqueue("D")     
    
    assert_equal(4, @queue.size())
  end

  # test Queue.enqueue()
  def test_enqueue_queue_holds_ABC_when_A_B_C_enqueued
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.enqueue("C")

    assert_equal("ABC", queueToString())
  end

  def test_enqueue_queue_holds_AB_when_A_B_enqueued_A_dequeued_C_enqueued
    @queue.enqueue("A")
    @queue.enqueue("B")
    @queue.dequeue()
    @queue.enqueue("C")
  
    assert_equal("BC", queueToString())
  end

  def test_enqueue_dequeue_cycling_is_done_when_multiple_enqueue_dequeue_done_not_reaching_capacity_5
    @queue.capacity = 5   
    @queue.enqueue("A")
    @queue.enqueue("B")
    @queue.enqueue("C")
    
    @queue.enqueue("E")
    @queue.dequeue()

    @queue.enqueue("F")
    @queue.dequeue()

    @queue.enqueue("G")
    @queue.dequeue()

    @queue.enqueue("H")
    @queue.dequeue()
    
    @queue.enqueue("I")
    @queue.dequeue()
    
 
    assert_equal("GHI", queueToString())
  end
  # test Queue.dequeue()
  def test_dequeue_size_is_3_when_dequeue_from_ABCD
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.enqueue("C")
    @queue.enqueue("D") 
    @queue.dequeue()
  
    assert_equal(3, @queue.size())
  end
  def test_dequeue_returns_nil_when_dequeue_from_empty
    @queue.enqueue("A")
    @queue.enqueue("B") 
    @queue.dequeue()
    @queue.dequeue()

    assert_equal(nil, @queue.dequeue())
  end

  def test_resize_queue_holds_more_than_5_items
    for i in 1..9
        @queue.enqueue(i)
    end
    assert_equal("123456789", queueToString())
  end
  def test_resize_capacity_equals_10_when_more_items_added_to_queue_capacity_5
    @queue.capacity = 5
    for i in 1..9
        @queue.enqueue(i)
    end
    assert_equal(10, @queue.capacity)
  end
  def test_resize_capacity_equals_2_when_only_one_item_added
    @queue.capacity = 10
    for i in 1..9
        @queue.enqueue(i)
    end
    for i in 1..7
        @queue.dequeue()
    end

    assert_equal(5, @queue.capacity())
  end

  def queueToString()
    str = ""
    @queue.iterate {|i| str += i.to_s}
    return str
  end
end