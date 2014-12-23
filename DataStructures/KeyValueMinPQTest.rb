require_relative 'KeyValueMinPQ'

require "test/unit"

class TestMaxPQ < Test::Unit::TestCase
 
  def setup
    @pq = KeyValueMinPQ.new()
  end

  # test size()
  def test_size_returns_0_when_pq_is_empty
    
    assert_equal(0, @pq.size())
  end
  def test_size_returns_1_after_1_key_is_added
    
    @pq.insert(0, 0.1)

    assert_equal(1, @pq.size()) 
  end
  def test_size_returns_3_after_3_keys_are_added
    
    @pq.insert(0, 0.1)
    @pq.insert(1, 0.2)
    @pq.insert(2, 0.1)
    assert_equal(3, @pq.size()) 
  end

  def test_size_returns_correct_size_after_delete
    
    @pq.insert(0, 0.0)
    @pq.insert(1, 0.1)
    @pq.insert(3, 0.3)
    @pq.insert(2, 0.2)

    @pq.delete()

    assert_equal(3, @pq.size()) 
  end

  # insert
  def test_insert_puts_key_in_expected_order
    
    @pq.insert(1, 0.1)
    @pq.insert(3, 0.3)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)

    assert_equal([0.1, 0.3, 0.2, 0.4], @pq.values.compact) 
  end
  def test_delete_deletes_key_and_arrange_pq_as_expected
    
    @pq.insert(1, 0.1)
    @pq.insert(3, 0.3)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)

    @pq.delete()

    assert_equal([0.2, 0.3, 0.4], @pq.values.compact)
  end

  # deleteMax
  def test_delete_deletes_and_returns_max_key_in_a_pq
    
    @pq.insert(1, 0.1)
    @pq.insert(6, 0.6)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)

    str = @pq.delete()

    assert_equal([1, 0.1], str) 
  end
  def test_delete_deletes_3_nodes_and_pq_stays_as_expected
    
    @pq.insert(1, 0.1)
    @pq.insert(6, 0.6)
    @pq.insert(8, 0.8)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)
    @pq.insert(5, 0.5)
    @pq.insert(9, 0.9)

    @pq.delete()
    @pq.delete()
    @pq.delete()

    assert_equal([0.5, 0.6, 0.9, 0.8], @pq.values.compact) 
  end

  # isEmpty
  def test_isEmpty_retuns_true_when_pq_is_just_created

    assert_equal(true, @pq.isEmpty())
  end
  def test_isEmpty_retuns_false_when_pq_has_added_items

    @pq.insert(0, 0.0)
  
    assert_equal(false, @pq.isEmpty())
  end

  # contains
    def test_contains_returns_true_when_key_is_present
    
    @pq.insert(1, 0.1)
    @pq.insert(6, 0.6)
    @pq.insert(8, 0.8)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)
    @pq.insert(5, 0.5)
    @pq.insert(9, 0.9)

    assert_equal(true, @pq.contains(5)) 
  end
  def test_contains_returns_false_when_key_is_present
    
    @pq.insert(1, 0.1)
    @pq.insert(6, 0.6)
    @pq.insert(8, 0.8)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)
    @pq.insert(5, 0.5)
    @pq.insert(9, 0.9)

    assert_equal(false, @pq.contains(15)) 
  end
  def test_contains_returns_false_for_empty_queue

    assert_equal(false, @pq.contains(15)) 
  end

  # updateValue
  def test_upsert_updates_value_without_changing_position
    
    @pq.insert(1, 0.1)
    @pq.insert(3, 0.3)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)

    @pq.upsert(2, 0.5)

    assert_equal([0.1, 0.3, 0.5, 0.4], @pq.values.compact) 
  end
  def test_upsert_inserts_value_when_key_is_not_present
    
    @pq.insert(1, 0.1)
    @pq.insert(3, 0.3)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)

    @pq.upsert(5, 0.5)

    assert_equal([0.1, 0.3, 0.2, 0.4, 0.5], @pq.values.compact) 
  end
  def test_upsert_updates_value_and_moves_item_to_correct_position
    
    @pq.insert(1, 0.1)
    @pq.insert(3, 0.3)
    @pq.insert(2, 0.2)
    @pq.insert(4, 0.4)

    @pq.upsert(1, 0.5)

    assert_equal([0.2, 0.3, 0.5, 0.4], @pq.values.compact) 
  end
end