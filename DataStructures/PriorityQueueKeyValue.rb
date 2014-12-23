#PriorityQueue
require_relative '../Sorts/SortUtils.rb'
class KeyValuePQ
     attr_accessor :values, :keys

    def initialize ()
        @values = Array.new()
        @keys = Array.new()
        @size = 0
    end

    def insert (key, value)
        @size += 1
        @values[@size] = value
        @keys[@size] = key
        swim(@size)
    end

    def deleteMax ()
        if @size == 0 then return nil end

        value_to_delete = @values[1]
        key_to_delete = @keys[1]
        exchKeyValue(@keys, @values, 1, @size)
        @values[@size] = nil
        @keys[@size] = nil
        @size -= 1

        sink(1, @size) 

        return key_to_delete, value_to_delete
    end

    def deleteMin ()
        if @size == 0 then return nil end

        value_to_delete = @values[@size]
        key_to_delete = @keys[@size]
        @values[@size] = nil
        @keys[@size] = nil
        @size -= 1

        sink(1, @size) 

        return key_to_delete, value_to_delete
    end

    def isEmpty ()
        return @size == 0
    end

    def size ()
        return @size
    end

    def swim (k)
        while k > 1 and @values[k] > @values[k / 2]
            exchKeyValue(@keys, @values, k, k / 2)
            k = k / 2
        end
    end

    def sink (k, n)
        while (k <= n) and ((k * 2 <= n and @values[k] < @values[k * 2]) or (k * 2 + 1 <= n and @values[k] < @values[k * 2 + 1]))
            if k * 2 + 1 <= n and  @values[k * 2 + 1] > @values[k * 2]
                exchKeyValue(@keys, @values, k, k * 2 + 1)
                k = k * 2 + 1
            else
                exchKeyValue(@keys, @values, k, k * 2)
                k = k * 2
            end 
        end  
    end
end
