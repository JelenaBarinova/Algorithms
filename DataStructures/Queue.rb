#queue linked list implementation
require_relative "LinkedList"

class Queue 
    #attr_accessor :value, :next
    #enqueue
    #dequeue

    def initialize ()   
        @first = Node.new() # first added to queue (oldest in queue, first to pop)
        @last = @first # last added to queue (most recent)
        @size = 0
    end

    def enqueue (value)
        node = Node.new(value, nil)
        @last.next = node
        @last = @last.next
        @size += 1
    end

    def dequeue ()
        value = nil
        if !@first.next.nil? then
            value = @first.next.value
            @first.next = @first.next.next
        end
        @size -= 1
        return value
    end

    def size ()
        return @size
    end

    def iterate ()
        current = @first.next
        while !current.nil? do
            yield current.value
            current = current.next
        end
    end
end