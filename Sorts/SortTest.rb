require "test/unit"


module SortTestCases 
	 
  	def test_sort_empty_returns_nil
      @array = Array.new()

      result = method(@sort).call(@array)
  	
  		assert_equal(nil, result)
  	end
  	def test_sort_single_item_array
      @array = Array.new([18])

      result = method(@sort).call(@array)

  		assert_equal([18], result)
  	end
  	def test_sort_randomly_filled_array  
      @array = Array.new([7, 3, 9])		

      result = method(@sort).call(@array)

  		assert_equal([3, 7, 9], result)
  	end
  	def test_sort_negative_and_positive_numbers
      @array = Array.new([0, 3, 9, -2, 3, -100])

      result = method(@sort).call(@array)

  		assert_equal([-100, -2, 0, 3, 3, 9], result)
  	end
  	def test_sort_when_sortted_otherwise
  		@array = Array.new([9, 7, 3, 0, -2, -100])

      result = method(@sort).call(@array)
  		
      assert_equal([-100, -2, 0, 3, 7, 9], result)
  	end
  	def test_sort_all_the_same_items
  		@array = Array.new([9, 9, 9])

      result = method(@sort).call(@array)

  		assert_equal([9, 9, 9], result)
  	end
  	def test_sort_randomly_filled_big_array
  		@array = Array.new(200.times.map{ Random.rand(100) })

      result = method(@sort).call(@array)

  		assert_equal(@array.sort(), result)
  	end
end