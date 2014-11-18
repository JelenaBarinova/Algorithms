require_relative "LinkedList"
require "test/unit"
# add (value, i)
# remove (i)
# reverse

class TestSinglyLinkedList < Test::Unit::TestCase
 
# test SinglyLinkedList.isEmpty()
  def test_SinglyLinkedList_returns_true_when_list_is_empty
  	linkedList = SinglyLinkedList.new()
  	
  	isEmpty = linkedList.isEmpty()

  	assert_equal(true, isEmpty)
  end
  def test_SinglyLinkedList_returns_false_when_list_has_nodes
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart(5)
  	
  	isEmpty = linkedList.isEmpty()

  	assert_equal(false, isEmpty)
  end

# test SinglyLinkedList.length()
  def test_SinglyLinkedList_returns_length_0_when_list_just_created
  	linkedList = SinglyLinkedList.new()

  	assert_equal(0, linkedList.length())
  end

  def test_SinglyLinkedList_returns_length_1_when_one_node_added
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart("A")

  	assert_equal(1, linkedList.length())
  end

  def test_SinglyLinkedList_returns_length_2_when_two_nodes_added
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart("A")
  	linkedList.addToStart("A")

  	assert_equal(2, linkedList.length())
  end

  def test_SinglyLinkedList_returns_length_20_when_twenty_nodes_added
    linkedList = SinglyLinkedList.new()
    linkedList.populate([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20])

    assert_equal(20, linkedList.length())
  end
  
# test SinglyLinkedList.addToStart()
  def test_SinglyLinkedList_holds_A_when_A_added_to_empty_list
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart("A")

  	assert_equal("A", linkedList.toString())
  end
  def test_SinglyLinkedList_holds_AB_when_A_added_to_start_of_B
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart("B")
  	linkedList.addToStart("A")

  	assert_equal("AB", linkedList.toString())
  end
    def test_SinglyLinkedList_holds_ABC_when_A_added_to_start_of_BC
  	linkedList = SinglyLinkedList.new()
    linkedList.populate(["B","C"])
  	linkedList.addToStart("A")

  	assert_equal("ABC", linkedList.toString())
  end
# test SinglyLinkedList.addToEnd()
  def test_SinglyLinkedList_holds_A_when_A_added_to_end_of_empty_list
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToEnd("A")

  	assert_equal("A", linkedList.toString())
  end
  def test_SinglyLinkedList_holds_AB_when_C_added_to_end_of_AB
  	linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B"])
	  linkedList.addToEnd("C")

  	assert_equal("ABC", linkedList.toString())
  end

# test SinglyLinkedList.get()
  def test_SinglyLinkedList_returns_A_from_ABCD_when_called_for_i_0
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal("A", linkedList.get(0))
  end

  def test_SinglyLinkedList_returns_C_from_ABCD_when_called_for_i_2
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal("C", linkedList.get(2))
  end

  def test_SinglyLinkedList_returns_D_from_ABCD_when_called_for_i_4
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal("D", linkedList.get(3))
  end

  def test_SinglyLinkedList_returns_nil_from_ABCD_when_called_for_i_8
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal(nil, linkedList.get(8))
  end

  def test_SinglyLinkedList_returns_D_from_ABCD_when_called_for_i_negative_1
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal("D", linkedList.get(-1))
  end

  def test_SinglyLinkedList_returns_A_from_ABCD_when_called_for_i_negative_4
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal("A", linkedList.get(-4))
  end

  def test_SinglyLinkedList_returns_nil_from_ABCD_when_called_for_i_negative_14
    linkedList = SinglyLinkedList.new()
    linkedList.populate(["A","B","C","D"])

    assert_equal(nil, linkedList.get(-14))
  end

# test SinglyLinkedList.toString()
  def test_SinglyLinkedList_returns_A_when_toStrig_called
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart("A")

  	assert_equal("A", linkedList.toString())
  end

  def test_SinglyLinkedList_returns_5_when_toStrig_called
  	linkedList = SinglyLinkedList.new()
  	linkedList.addToStart(5)

  	assert_equal("5", linkedList.toString())
  end
	
end