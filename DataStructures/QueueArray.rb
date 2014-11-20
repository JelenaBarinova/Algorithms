#queue linked list implementation
require_relative "LinkedList"

class Queue 
    #attr_accessor :value, :next
    #enqueue
    #dequeue

    def initialize ()   
        @list = Array.new(10)
        @first = nil # first added to queue (oldest in queue, first to pop)
        @last = nil # the index after last added node (= 2 for queueu of AB)
        @size = 0
    end

    def isEmpty ()
        return @first == @last
    end

    def enqueue (value)

        @list.insert(@last ||= 0, value)
        @last += 1 
        @first ||= 0
        @size += 1
    end

    def dequeue ()
        if self.isEmpty() then return nil
        else
            value = @list[@first] 
            @list[@first]=nil
            @first += 1
            @size -= 1
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
            while i <= @last - 1 do
                yield @list[i]
                i += 1
            end
        end
    end
end