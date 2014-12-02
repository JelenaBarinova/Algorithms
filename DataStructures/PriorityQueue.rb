#PriorityQueue
require_relative '../Sorts/SortUtils.rb'
class MaxPQ

    def initialize ()
        @keys = Array.new()
        @size = 0
    end

    def insert (key)
        @size += 1
        @keys[@size] = key
        swim(@size)
    end

    def deleteMax ()
        if @size == 0 then return nil end

        key_to_delete = @keys[1]
        sink(1) 
        return key_to_delete
    end

    def isEmpty ()
        return @size == 0
    end

    def size ()
        return @size
    end

    def swim (k)
        while k > 1 and @keys[k] > @keys[k / 2]
            exch(@keys, k, k / 2)
            k = k / 2
        end
    end

    def sink (k)
        while k <= @size - 1 and !@keys[k * 2].nil?
            if @keys[(k * 2) + 1].nil? or @keys[k * 2] > @keys[(k * 2) + 1] then
                @keys[k] = @keys[k * 2]
                k = k * 2
            else
                @keys[k] = @keys[(k * 2) + 1]
                k = (k * 2) + 1
            end 
        end  
        @keys[@size] = nil
    end

    def to_s ()
        str = ""
        for i in 1..@size
            str = str + @keys[i].to_s
            i += 1
        end
        return str
    end

end
