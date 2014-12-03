require_relative 'SortTest'

require_relative 'BubbleSort'
require_relative 'SelectionSort'
require_relative 'InsertionSort'
require_relative 'ShellSort'
require_relative 'MergeSort'
require_relative 'QuickSort'
require_relative '3WayPartitioningQuickSort'
require_relative 'HeapSort'

require 'test/unit/ui/console/testrunner'

Test::Unit.run = true

class BubbleSortTest < Test::Unit::TestCase
  	def setup
		@sort = 'BubbleSort' 
   	end
	include SortTestCases
end

class SelectionSortTest < Test::Unit::TestCase
  	def setup
		@sort = 'SelectionSort' 
   	end
	include SortTestCases
end

class InsertionSortTest < Test::Unit::TestCase
  	def setup
		@sort = 'InsertionSort' 
   	end
	include SortTestCases
end

class ShellSortTest < Test::Unit::TestCase
    def setup
        @sort = 'ShellSort' 
    end
    include SortTestCases
end

class MergeSortTest < Test::Unit::TestCase
    def setup
        @sort = 'MergeSort' 
    end
    include SortTestCases
end

class QuickSortTest < Test::Unit::TestCase
    def setup
        @sort = 'QuickSort' 
    end
    include SortTestCases
end

class ThreeWayPartitioningQuickSort < Test::Unit::TestCase
    def setup
        @sort = 'ThreeWayPartitioningQuickSort' 
    end
    include SortTestCases
end

class HeapSort < Test::Unit::TestCase
    def setup
        @sort = 'HeapSort' 
    end
    include SortTestCases
end

sortTestSuite = Test::Unit::TestSuite.new("Test all sorting algorithms") 
sortTestSuite << BubbleSortTest.suite
sortTestSuite << SelectionSortTest.suite
sortTestSuite << InsertionSortTest.suite
sortTestSuite << ShellSortTest.suite
sortTestSuite << MergeSortTest.suite
sortTestSuite << QuickSortTest.suite
sortTestSuite << ThreeWayPartitioningQuickSort.suite
sortTestSuite << HeapSort.suite

Test::Unit::UI::Console::TestRunner.run(sortTestSuite)