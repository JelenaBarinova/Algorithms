#linked list

class Node 
	attr_accessor :value, :next

	def initialize (value=nil, next_node=nil)
		@value = value
		@next=next_node
	end
end

class SinglyLinkedList
	

	def initialize ()
		#create with fake head
		@head = Node.new()
	end

	def isEmpty ()
		#unless @head.next.nil? true : false end
		if @head.next == nil then true
		else false 
		end
	end


	def length ()
		current = @head.next #skipping fake head
		length = 0

		while current != nil do
			length = length + 1
			current = current.next
		end
		return length
	end

	def get (index)

		if index < 0 then index = self.length() + index end

		i = 0
		current_value = nil
		current = @head.next

		while current != nil do
			if i == index then current_value = current.value end
			current = current.next
			i += 1
		end 

		return current_value
	end

	def addToStart (value)
		current = @head.next #skipping fake head
		new_node = Node.new(value, current)
		@head.next = new_node
	end

	def addToEnd (value)
		current = @head
		while current.next != nil do
			current = current.next  
		end 
		new_node = Node.new(value, nil)
		current.next = new_node
	end

	def toString ()
		current = @head.next #skipping fake head
		str = ""

		while current != nil
			str = str + current.value.to_s
			current = current.next
		end
		return str
	end

	def populate (arr)
		if !arr.empty? then
			arr.each { |a| self.addToEnd(a) }
		end
	end


end