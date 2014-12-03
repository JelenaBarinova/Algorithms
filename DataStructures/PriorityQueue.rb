#PriorityQueue
require_relative '../Sorts/SortUtils.rb'
class MaxPQ
     attr_accessor :keys

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

        sink(1, @size) 

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

    def sink (k, n)
        while (k <= n) and ((k * 2 <= n and @keys[k] < @keys[k * 2]) or (k * 2 + 1 <= n and @keys[k] < @keys[k * 2 + 1]))
            if k * 2 + 1 <= n and  @keys[k * 2 + 1] > @keys[k * 2]
                exch(@keys, k, k * 2 + 1)
                k = k * 2 + 1
            else
                exch(@keys, k, k * 2)
                k = k * 2
            end 
        end  
    end
end
