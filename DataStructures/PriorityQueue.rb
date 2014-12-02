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
        exch(@keys, 1, @size)
        @keys[@size] = nil
        @size -= 1

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
        while k < @size  and ((!@keys[k * 2].nil? and @keys[k] < @keys[k * 2]) or (!@keys[k * 2 + 1].nil? and @keys[k] < @keys[k * 2 + 1]))
            
            if !@keys[k * 2 + 1].nil? and @keys[k * 2] > @keys[k * 2 + 1]
                exch(@keys, k, k * 2)
                k = k * 2
            else
                exch(@keys, k, k * 2 + 1)
                k = k * 2 + 1
            end 
        end  
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
