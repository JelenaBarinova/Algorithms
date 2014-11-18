#stack linked list implementation
require_relative "LinkedList"

class Stack 
	#attr_accessor :value, :next
	# push insert
	# pop remove
	# iterate
	# isEmpty
	# length

	def initialize ()
		@list = SinglyLinkedList.new()
	end

	def size ()
		return @list.length()
	end

	def isEmpty ()
		if self.size() != 0 then false
		else true
		end
	end

	def push (value)
		@list.add(value, 0)
	end

	def pop ()
		node_value = @list.get(0)
		@list.remove(0)
		return node_value
	end

	def toString()
		return @list.toString()
	end

end