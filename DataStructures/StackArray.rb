#stack array implementation
class Stack 

    def initialize ()
        @capacity = 1
        @size = 0
        @list = Array.new(@capacity, nil)
    end

    def size ()
        return @size
    end

    def isEmpty ()
        return @size == 0
    end

    def push (value)
        @list.push(value)
        @size += 1
        if @list.size() == @capacity then
            self.resize (@capacity * 2) 
        end
    end

    def pop ()
        if @list.size() == @capacity / 4 then
            self.resize (@capacity / 2)
        end
        @size -= 1
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