#stack array implementation
class Stack 
    #attr_accessor :value, :next
    # push insert
    # pop remove
    # iterate
    # isEmpty
    # length

    def initialize ()
        @capacity = 1
        @list = Array.new(@capacity, nil)
    end

    def size ()
        return @list.compact.length
    end

    def isEmpty ()
        if self.size() != 0 then false
        else true
        end
    end

    def push (value)
        @list.push(value)
        if @list.size() == @capacity then
            self.resize (@capacity * 2) 
        end
    end

    def pop ()
        if @list.size() == @capacity / 4 then
            self.resize (@capacity / 2)
        end
        return @list.pop()
    end

    def peek ()
        return @list.last()
    end

    def toString()
        str = ""
        @list.reverse_each {|i| str = str + i.to_s}
        return str
    end

    def resize (new_capacity)
        @capacity = new_capacity
        new_list = Array.new(@capacity)
        @list.each {|i| new_list.push(i)}
        @list = new_list
    end
end