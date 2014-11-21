require_relative 'SortTest'

require_relative "BubbleSort"
require_relative "SelectionSort"

require 'test/unit/ui/console/testrunner'

testSuite = Test::Unit::TestSuite.new("Test all sorting algorythms")

testSuite << SortTestCases.new('BubbleSort')
testSuite << SortTestCases.new('SelectionSort')
testSuite << SortTestCases.new('BubbleSort')

Test::Unit::UI::Console::TestRunner.run(testSuite)