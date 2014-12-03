require_relative 'PriorityQueue'

require "test/unit"


class TestMaxPQ < Test::Unit::TestCase
 
  def setup
    @pq = MaxPQ.new()
  end

  # test size()
  def test_size_returns_0_when_pq_is_empty
    
    assert_equal(0, @pq.size())
  end

  def test_size_returns_1_after_1_key_is_added
    
    @pq.insert("A")

    assert_equal(1, @pq.size()) 
  end

  def test_size_returns_3_after_3_keys_are_added
    
    @pq.insert("A")
    @pq.insert("C")
    @pq.insert("B")
    assert_equal(3, @pq.size()) 
  end

  def test_size_returns_correct_size_after_delete
    
    @pq.insert('A')
    @pq.insert('F')
    @pq.insert('B')
    @pq.insert('D')

    @pq.deleteMax()

    assert_equal(3, @pq.size()) 
  end
  
  # insert
  def test_insert_puts_key_in_expected_order
    
    @pq.insert('A')
    @pq.insert('C')
    @pq.insert('B')
    @pq.insert('D')
    assert_equal(["D", "C", "B", "A"], @pq.keys.compact) 
  end

  # insert@keys[k * 2 + 1].nil?
  def test_deleteMax_deletes_key_and_arrange_pq_as_expected
    
    @pq.insert('A')
    @pq.insert('C')
    @pq.insert('B')
    @pq.insert('D')

    @pq.deleteMax()
    assert_equal(["C", "A", "B"], @pq.keys.compact)
  end

  # insert
  def test_deleteMax_deletes_and_returns_max_key_in_a_pq
    
    @pq.insert('A')
    @pq.insert('F')
    @pq.insert('B')
    @pq.insert('D')

    str = @pq.deleteMax()

    assert_equal("F", str) 
  end

  def test_deleteMax_deletes_3_nodes_and_pq_stays_as_expected
    
    @pq.insert('A')
    @pq.insert('F')
    @pq.insert('K')
    @pq.insert('B')
    @pq.insert('D')
    @pq.insert('G')
    @pq.insert('M')

    @pq.deleteMax()
    @pq.deleteMax()
    @pq.deleteMax()

    assert_equal(["F", "D", "B", "A"], @pq.keys.compact) 
  end

  # isEmpty
  def test_isEmpty_retuns_true_when_pq_is_just_created

    assert_equal(true, @pq.isEmpty())
  end


end