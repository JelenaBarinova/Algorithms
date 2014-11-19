#linked list

class Node 
    attr_accessor :value, :next

    def initialize (value=nil, next_node=nil)
        @value = value
        @next = next_node
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
            length += 1
            current = current.next
        end
        return length
    end

    def get (index)

        # O(2n) -> O(n)
        current = @head.next

        if index < 0 then
            second = current
            index += 1

            while index < 0 and !second.next.nil? do
                index += 1
                second = second.next
            end

            if index < 0 then
                return nil
            end

            while !second.next.nil? do
                second = second.next
                current = current.next
            end

            return current.value           
        end

        i = 0
        while current != nil do
            if i == index then 
                return current.value
            end
            current = current.next
            i += 1
        end 

        return nil
    end

    def add (value, index)
        current = @head #insert will happen after current

        if index < 0 then
            second = current
            index += 1

            while index < 0 and !second.next.nil? do
                index += 1
                second = second.next
            end

            if index < 0 then
                return nil
            end

            while !second.next.nil? do
                second = second.next
                current = current.next
            end           
        end

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
        current = @head

        if index < 0 then
            second = current


            while index < 0 and !second.next.nil? do
                index += 1
                second = second.next
            end

            if index < 0 then
                return nil
            end

            while !second.next.nil? do
                second = second.next
                current = current.next
            end           
            value = current.next.value
            current.next = current.next.next
            return value
        end

        i = 0

        while current.next != nil and i <= index do
            if i == index then 
                value = current.next.value
                current.next = current.next.next
                return value
            end
            current = current.next
            i += 1
        end 
    end

    def reverse ()
        # no extra memory, just relinking
        new_head = Node.new(nil,nil) #fake head for reversed list
        current = @head

        while current != nil do
            node = current 
            current = current.next
            node.next = new_head.next
            new_head.next = node
        end 
        @head = new_head
    end
    def iterate ()
        current_node = @head.next

        while current_node != nil
            yield current_node.value
            current_node = current_node.next
        end
    end

    def addToStart (value)
        self.add(value, 0)
    end

    def addToEnd (value)
        self.add(value,-1)
    end

    def toString ()     
        str = ""
        self.iterate {|i| str = str + i.to_s}
        return str
    end

    def populate (arr)
        if !arr.empty? then
            arr.each { |a| self.addToEnd(a) }
        end
    end
end