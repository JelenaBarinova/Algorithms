#require_relative "BubbleSort"
require_relative "SelectionSort"
require "test/unit"


class TestSorts < Test::Unit::TestCase
	def setup

    	@array = Array.new()
  	end

  	def test_sort_empty_returns_nil
  	
  		assert_equal(nil, Sort(@array))
  	end
  	def test_sort_single_item_array
  		
  		@array.push(18)
  		assert_equal([18], Sort(@array))
  	end
  	def test_sort_randomly_filled_array
  		
  		@array = [7, 3, 9]
  		assert_equal([3, 7, 9], Sort(@array))
  	end
  	def test_sort_negative_and_positive_numbers
  		
  		@array = [0, 3, 9, -2, 3, -100]
  		assert_equal([-100, -2, 0, 3, 3, 9], Sort(@array))
  	end
  	def test_sort_when_sortted_otherwise
  		
  		@array = [9, 7, 3, 0, -2, -100]
  		assert_equal([-100, -2, 0, 3, 7, 9], Sort(@array))
  	end
  	def test_sort_all_the_same_items
  		
  		@array = [9, 9, 9]
  		assert_equal([9, 9, 9], Sort(@array))
  	end
  	def test_sort_randomly_filled_big_array
  		
  		@array = 200.times.map{ Random.rand(100) } 
  		assert_equal(@array.sort(), Sort(@array))
  	end
end