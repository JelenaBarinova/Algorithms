#require_relative "Stack"
require_relative "StackArray"

require "test/unit"


class TestStack < Test::Unit::TestCase
 

  def setup
    @stack = Stack.new()
  end

  # test size()
  def test_size_returns_0_when_stack_is_empty
    
    assert_equal(0, @stack.size())
  end

  def test_size_returns_5_when_5_nodes_added
    @stack.push("A")
    @stack.push("B")
    @stack.push("C")
    @stack.push("D")
    @stack.push("E")

    assert_equal(5, @stack.size())
  end

  # test isEmpty()
  def test_isEmpty_returns_true_when_stack_is_empty
    
    assert_equal(true, @stack.isEmpty())
  end

  def test_isEmpty_returns_false_when_stack_is_not_empty
    @stack.push("A")

    assert_equal(false, @stack.isEmpty())
  end

  # test push()
  def test_push_returns_size_1_when_one_value_pushed
    @stack.push("A")
    
    assert_equal(1, @stack.size())
  end

  def test_push_returns_ABCD_when_pushed_DCBA
    @stack.push("D")
    @stack.push("C")
    @stack.push("B")
    @stack.push("A")
    
    assert_equal("ABCD", @stack.toString())
  end
  
# test pop()
  def test_pop_returns_A_pop_from_AB
    @stack.push("B")
    @stack.push("A")
    
    assert_equal("A", @stack.pop())
  end

  def test_pop_returns_CBA_for_stack_after_pop_from_DCBA
    @stack.push("A")
    @stack.push("B")
    @stack.push("C")
    @stack.push("D")
    
    @stack.pop()
    
    assert_equal("CBA", @stack.toString())
  end

# test peek()
  def test_peek_returns_A_from_AB
    @stack.push("B")
    @stack.push("A")
    
    assert_equal("A", @stack.peek())
  end

  def test_peek_size_stays_2_for_AB
    @stack.push("B")
    @stack.push("A")

    @stack.peek()

    assert_equal(2, @stack.size())
  end

end