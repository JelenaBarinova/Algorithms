require_relative 'SortTest'

require_relative 'BubbleSort'
require_relative 'SelectionSort'
require_relative 'InsertionSort'
require_relative 'ShellSort'

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

sortTestSuite = Test::Unit::TestSuite.new("Test all sorting algorithms") 
sortTestSuite << BubbleSortTest.suite
sortTestSuite << SelectionSortTest.suite
sortTestSuite << InsertionSortTest.suite
sortTestSuite << ShellSortTest.suite

Test::Unit::UI::Console::TestRunner.run(sortTestSuite)