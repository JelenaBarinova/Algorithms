#queue linked list implementation
require_relative "LinkedList"

class Queue 
    #attr_accessor :value, :next
    #enqueue
    #dequeue

    def initialize ()   
        @first = Node.new() # first added to queue (oldest in queue, first to pop)
        @last = @first # last added to queue (most recent)
    end

    def enqueue (value)
        node = Node.new(value, nil)
        @last.next = node
        @last = @last.next
    end

    def dequeue ()
        value = nil
        if !@first.next.nil? then
            value = @first.next.value
            @first.next = @first.next.next
        end
        return value
    end

    def size ()
        i = 0
        current = @first.next

        while !current.nil? 
            i += 1
            current = current.next
        end
        return i
    end
end