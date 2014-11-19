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
        return @list.remove(0)
    end

    def peek ()
        return @list.get(0)
    end

    def toString()
        str = ""
        @list.iterate {|i| str = str + i.to_s}
        return str
    end

end