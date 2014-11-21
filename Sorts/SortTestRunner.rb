require_relative 'SortTest'

require_relative 'BubbleSort'
require_relative 'SelectionSort'

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

sortTestSuite = Test::Unit::TestSuite.new("Test all sorting algorithms") 
sortTestSuite << BubbleSortTest.suite
sortTestSuite << SelectionSortTest.suite

Test::Unit::UI::Console::TestRunner.run(sortTestSuite)