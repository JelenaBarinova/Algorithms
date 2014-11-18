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

	def add (value, index)
		if index < 0 then index = self.length() + index + 1 end

		current = @head #insert will happen after current
		i = 0

		while current != nil and i <= index do
			if i == index then 
				new_node = Node.new(value, current.next) 
				current.next = new_node
				return
			end
			current = current.next
			i += 1
		end 
	end

	def remove (index)
		if index < 0 then index = self.length() + index end

		current = @head #delete will happen after current
		i = 0

		while current.next != nil and i <= index do
			if i == index then 
				current.next = current.next.next
				return
			end
			current = current.next
			i += 1
		end 
	end

	def reverse ()
		new_head = Node.new(nil,nil) #fake head for reversed list
		new_next = nil
		current = @head.next

		while current != nil do

			new_head.next = Node.new(current.value, new_head.next)			
			current = current.next
		end 
		@head.next = new_head.next
	end

	def addToStart (value)
		self.add(value, 0)
	end

	def addToEnd (value)
		self.add(value,-1)
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