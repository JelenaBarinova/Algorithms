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
    end

    def isEmpty ()
        return @first == @last
    end

    def enqueue (value)

        @list.insert(@last ||= 0, value)
        @last += 1 
        @first ||= 0
    end

    def dequeue ()
        if self.isEmpty() then return nil
        else
            value = @list[@first] 
            @list[@first]=nil
            @first += 1
            return value
        end
    end

    def size ()
        if self.isEmpty() then return 0 
        else
            i = 0
            self.iterate {|a| i += 1}
            return i
        end
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