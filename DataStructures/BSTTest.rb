require_relative 'BST'
require_relative 'QueueArray'

require "test/unit"


class TestBST < Test::Unit::TestCase
    def setup
        @bst = BST.new()
    end

    # test new()
    def test_new_returns_not_nil
        is_nil = @bst.nil?

        assert_equal(false, is_nil)
    end

    #put
    def test_put_adds_key_value_to_empty_tree
        @bst.put('A', 1)

        assert_equal(1, @bst.size())
    end
    def test_put_adds_two_new_nodes_to_empty_tree
        @bst.put('A', 1)
        @bst.put('B', 2)
        
        assert_equal(2, @bst.size())
    end
    def test_put_adds_five_new_nodes_to_empty_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        
        assert_equal(5, @bst.size())
    end
    def test_put_updates_the_value_when_key_is_present
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        assert_equal(5, @bst.size())
    end

    # get
    def test_get_returns_updated_value_of_a_given_key
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        res = @bst.get('B')
        
        assert_equal(0, res)
    end
    def test_get_returns_nil_when_tree_is_empty
        res = @bst.get(5)
        
        assert_equal(nil, res)
    end
    def test_get_returns_nil_when_key_is_not_present
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        res = @bst.get('FF')
        
        assert_equal(nil, res)
    end
    def test_get_returns_value_of_a_given_key
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        res = @bst.get('A')
        
        assert_equal(1, res)
    end

    # min()
    def test_min_returns_min_value_of_a_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        res = @bst.min()
        
        assert_equal(1, res)
    end
    def test_min_returns_nil_then_tree_is_empty

        res = @bst.min()
        
        assert_equal(nil, res)
    end

    # max()
    def test_max_returns_max_value_of_a_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        res = @bst.max()
        
        assert_equal(2, res)
    end
    def test_max_returns_nil_then_tree_is_empty

        res = @bst.max()
        
        assert_equal(nil, res)
    end

    # deleteMin()
    def test_deleteMin__deletes_min_and_size_decreses
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        @bst.deleteMin()

        res = @bst.size()
        
        assert_equal(4, res)
    end
    def test_deleteMin_deletes_min_and_min_becomes_second_min_key
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        @bst.deleteMin()

        res = @bst.min()
        
        assert_equal(0, res)
    end
    def test_deleteMin_deletes_min_when_there_is_one_node_in_a_tree
        @bst.put('D', 1)

        @bst.deleteMin()
        res = @bst.size()
        
        assert_equal(0, res)
    end

    # delete
    def test_delete_deletes_when_given_key_is_min_then_size_decreases
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        @bst.delete('A')

        res = @bst.size()
        
        assert_equal(4, res)
    end
    def test_delete_deletes_when_given_key_is_max_then_size_decreases
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)

        @bst.delete('F')

        res = @bst.size()
        
        assert_equal(4, res)
    end
    def test_delete_deletes_when_given_key_node_has_both_children
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)
        @bst.put('M', 8)
        @bst.put('B', 0)
        @bst.put('G', 3)
        @bst.put('N', 5)

        @bst.delete('D')

        res = @bst.size()
        
        assert_equal(7, res)
    end

    # keys
    def test_keys_returns_queue_of_a_bs_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)

        q = @bst.keys()
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("ABCDF", res)
    end
    def test_keys_returns_empty_queue_for_empty_tree
        q = @bst.keys()
        res = q.isEmpty()
        assert_equal(true, res)
    end
    def test_keys_returns_correct_queue_of_a_bs_tree_after_put_delete_and_update
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('X', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)
        @bst.put('X', 1)
        @bst.delete('F')

        q = @bst.keys()
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("ABCDX", res)
    end
# keys preOrder
    def test_keys_preorder_returns_queue_of_a_bs_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)

        q = @bst.keys(OrderType::PRE)
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("DBACF", res)
    end
    def test_keys_preorder_returns_empty_queue_for_empty_tree
        q = @bst.keys(OrderType::PRE)
        res = q.isEmpty()
        assert_equal(true, res)
    end
    def test_keys_preorder_returns_correct_queue_of_a_bs_tree_after_put_delete_and_update
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('X', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)
        @bst.put('X', 1)
        @bst.delete('F')

        q = @bst.keys(OrderType::PRE)
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("DBACX", res)
    end
    # keys postOrder
    def test_keys_postorder_returns_queue_of_a_bs_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)

        q = @bst.keys(OrderType::POST)
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("ACBFD", res)
    end
    def test_keys_postorder_returns_empty_queue_for_empty_tree
        q = @bst.keys(OrderType::POST)
        res = q.isEmpty()
        assert_equal(true, res)
    end
    def test_keys_postorder_returns_correct_queue_of_a_bs_tree_after_put_delete_and_update
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('X', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)
        @bst.put('X', 1)
        @bst.delete('F')

        q = @bst.keys(OrderType::POST)
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("ACBXD", res)
    end
    # keys levelOrder
    def test_keys_levelorder_returns_queue_of_a_bs_tree
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('F', 2)

        q = @bst.keys(OrderType::LEVEL)
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("DBFAC", res)
    end
    def test_keys_levelorder_returns_empty_queue_for_empty_tree
        q = @bst.keys(OrderType::LEVEL)
        res = q.isEmpty()
        assert_equal(true, res)
    end
    def test_keys_levelorder_returns_correct_queue_of_a_bs_tree_after_put_delete_and_update
        @bst.put('D', 1)
        @bst.put('B', 3)
        @bst.put('C', 4)
        @bst.put('A', 1)
        @bst.put('X', 1)
        @bst.put('F', 2)
        @bst.put('B', 0)
        @bst.put('X', 1)
        @bst.delete('F')

        q = @bst.keys(OrderType::LEVEL)
        res = ''
        q.iterate {|i| res += i.key.to_s}
        assert_equal("DBXAC", res)
    end
end