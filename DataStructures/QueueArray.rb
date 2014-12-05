#queue array implementation
class Queue 
    attr_accessor :capacity

    def initialize ()   
        @capacity = 1
        @list = Array.new(@capacity)
        @first = nil # first added to queue (oldest in queue, first to pop)
        @last = nil # the index after last added node (= 2 for queueu of AB)
        @size = 0
    end

    def isEmpty ()
        return @size == 0
    end

    def enqueue (value)
        if @size == @capacity then self.resize(@capacity * 2) end

        @list[@last ||= 0] = value
        @first ||= 0
        @size += 1

        #use array from beginning next time for enqueue
        @last = (@last + 1) % @capacity
    end

    def dequeue ()
        if self.isEmpty() then return nil
        else
            value = @list[@first] 
            @list[@first] = nil

            #if dequeued last array element, start using array from beginning next time for enqueue
            @first = (@first + 1) % @capacity

            @size -= 1
            if @size == @capacity / 4 then self.resize(@capacity / 2) end

            return value
        end
    end

    def size ()
        return @size
    end

    def iterate ()
        if self.isEmpty() then return nil
        else    
            i = @first
            while i < @first + @size do
                yield @list[i % @capacity]
                i += 1
            end
        end
    end

    def resize (new_capacity)
        @capacity = new_capacity
        @new_list = Array.new(@capacity)

        i = 0
        self.iterate do |value|
            @new_list[i] = value
            i += 1    
        end
        
        @list = @new_list
        @first = 0
        @last = @size
    end
end