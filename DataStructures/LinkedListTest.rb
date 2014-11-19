require_relative "LinkedList"
require "test/unit"
# reverse

class TestSinglyLinkedList < Test::Unit::TestCase
 
  def setup
    @linkedList = SinglyLinkedList.new()
  end

# test SinglyLinkedList.isEmpty()
  def test_isEmpty_returns_true_when_list_is_empty
  	
  	assert_equal(true, @linkedList.isEmpty())
  end
  def test_isEmpty_returns_false_when_list_has_nodes
  	@linkedList.addToStart(5)

  	assert_equal(false, @linkedList.isEmpty())
  end

# test SinglyLinkedList.length()
  def test_length_returns_0_when_list_just_created

  	assert_equal(0, @linkedList.length())
  end
  def test_length_returns_1_when_one_node_added
  	@linkedList.addToStart("A")

  	assert_equal(1, @linkedList.length())
  end
  def test_length_returns_2_when_two_nodes_added
  	@linkedList.addToStart("A")
  	@linkedList.addToStart("A")

  	assert_equal(2, @linkedList.length())
  end
  def test_length_returns_20_when_twenty_nodes_added
    populate([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20])

    assert_equal(20, @linkedList.length())
  end
  
# test SinglyLinkedList.addToStart()
  def test_toString_returns_A_when_A_added_to_empty_list
  	@linkedList.addToStart("A")

  	assert_equal("A", listToString())
  end
  def test_toString_returns_AB_when_A_added_to_start_of_B
  	@linkedList.addToStart("B")
  	@linkedList.addToStart("A")

  	assert_equal("AB", listToString())
  end
  def test_toString_returns_ABC_when_A_added_to_start_of_BC
  	populate(["B","C"])
  	@linkedList.addToStart("A")

  	assert_equal("ABC", listToString())
  end

# test SinglyLinkedList.addToEnd()
  def test_addToEnd_adds_A_when_to_end_of_empty_list
  	@linkedList.addToEnd("A")

  	assert_equal("A", listToString())
  end
  def test_addToEnd_list_holds_AB_when_C_added_to_end_of_AB
  	populate(["A","B"])
	  @linkedList.addToEnd("C")

  	assert_equal("ABC", listToString())
  end

# test SinglyLinkedList.get()
  def test_get_returns_A_from_ABCD_when_called_for_i_0
    populate(["A","B","C","D"])

    assert_equal("A", @linkedList.get(0))
  end
  def test_get_returns_C_from_ABCD_when_called_for_i_2
    populate(["A","B","C","D"])

    assert_equal("C", @linkedList.get(2))
  end
  def test_get_returns_D_from_ABCD_when_called_for_i_4
    populate(["A","B","C","D"])

    assert_equal("D", @linkedList.get(3))
  end
  def test_get_returns_nil_from_ABCD_when_called_for_i_8
    populate(["A","B","C","D"])

    assert_equal(nil, @linkedList.get(8))
  end
  def test_get_returns_D_from_ABCD_when_called_for_i_negative_1
    populate(["A","B","C","D"])

    assert_equal("D", @linkedList.get(-1))
  end
  def test_get_returns_A_from_ABCD_when_called_for_i_negative_4
    populate(["A","B","C","D"])

    assert_equal("A", @linkedList.get(-4))
  end
  def test_get_returns_nil_from_ABCD_when_called_for_i_negative_14
    populate(["A","B","C","D"])

    assert_equal(nil, @linkedList.get(-14))
  end

# test SinglyLinkedList.add()
  def test_add_list_holds_ABC_when_A_added_at_index_0_of_BC
    populate(["B","C"])

    @linkedList.add("A", 0)

    assert_equal("ABC", listToString())
  end
  def test_add_list_holds_ABC_when_C_added_at_index_2_of_AB
    populate(["A","B"])

    @linkedList.add("C", 2)

    assert_equal("ABC", listToString())
  end
  def test_add_list_holds_ABC_when_B_added_at_index_1_of_AC
    populate(["A","C"])

    @linkedList.add("B", 1)

    assert_equal("ABC", listToString())
  end
  def test_add_list_holds_ABCD_when_D_added_at_index_3_of_ABC
    populate(["A","B","C"])

    @linkedList.add("D", 3)

    assert_equal("ABCD", listToString())
  end
  def test_add_list_holds_ABCD_when_F_added_at_non_exzisting_index_7_of_ABC
    populate(["A","B","C","D"])

    @linkedList.add("F", 7)

    assert_equal("ABCD", listToString())
  end
  def test_add_list_holds_ABCD_when_C_added_at_index_2_negative_of_ABD
    populate(["A","B","D"])

    @linkedList.add("C", -2)

    assert_equal("ABCD", listToString())
  end
  def test_add_list_holds_ABCD_when_D_added_at_index_1_negative_of_ABC
    populate(["A","B","C"])

    @linkedList.add("D", -1)

    assert_equal("ABCD", listToString())
  end
  def test_add_list_holds_ABCD_when_F_added_at_non_exzisting_index_7_negative_of_ABC
    populate(["A","B","C","D"])

    @linkedList.add("F", -7)

    assert_equal("ABCD", listToString())
  end

  # test SinglyLinkedList.remove()
  def test_remove_list_holds_AC_when_node_removed_at_index_1_of_ABC
    populate(["A","B","C"])

    @linkedList.remove(1)

    assert_equal("AC", listToString())
  end
    def test_remove_list_returns_nil_when_node_removed_at_nonexisting_index_7_of_ABCDF
    populate(["A","B","C","D","F"])

    assert_equal(nil, @linkedList.remove(7))
  end
  def test_remove_list_holds_AB_when_node_removed_at_index_1_negative_of_ABC
    populate(["A","B","C"])

    @linkedList.remove(-1)

    assert_equal("AB", listToString())
  end
  def test_remove_list_returns_A_when_node_removed_at_index_5_negative_of_ABCDF
    populate(["A","B","C","D","F"])

    assert_equal("A", @linkedList.remove(-5))
  end
  def test_remove_list_returns_nil_when_node_removed_at_nonexisting_index_7_negative_of_ABCDF
    populate(["A","B","C","D","F"])

    assert_equal(nil, @linkedList.remove(-7))
  end

# test SinglyLinkedList.reverse()
  def test_reverse_returns_CBA_when_given_ABC
    populate(["A","B","C"])

    @linkedList.reverse()

    assert_equal("CBA", listToString())
  end
  def test_reverse_returns_FDCBA_when_given_ABCDF
    populate(["A","B","C","D","F"])

    @linkedList.reverse()

    assert_equal("FDCBA", listToString())
  end
  def test_reverse_returns_A_when_given_A
    populate(["A"])

    @linkedList.reverse()

    assert_equal("A", listToString())
  end

# test SinglyLinkedList.iterate()  
  def test_iterate_returns_ABCD_from_ABCD
    populate(["A","B","C","D"])

    str = ""
    @linkedList.iterate {|i| str = str + i}
    
    assert_equal("ABCD", str)
  end

# test SinglyLinkedList.toString()
  def test_toString_returns_A_when_toStrig_called
  	@linkedList.addToStart("A")

  	assert_equal("A", listToString())
  end

  def test_toString_returns_5_when_toStrig_called
  	@linkedList.addToStart(5)

  	assert_equal("5", listToString())
  end
# helper functions
  def populate (arr)
        if !arr.empty? then
            arr.each { |a| @linkedList.addToEnd(a) }
        end
  end
  def listToString ()     
        str = ""
        @linkedList.iterate {|i| str = str + i.to_s}
        return str
  end
	
end