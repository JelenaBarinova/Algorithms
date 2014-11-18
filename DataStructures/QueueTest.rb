require_relative "Queue"
require "test/unit"


class TestQueue < Test::Unit::TestCase
 
# test Queue.toString()
  def test_toString_returns_A_when_A_enqueued
  	queue = Queue.new()

  	assert_equal(true, queue)
  end