require_relative '../Sorts/SortUtils.rb'
require_relative 'KeyValueBasePQ'

class KeyValueMinPQ < KeyValueBasePQ

protected

    def updateValue (key, value)
        if !contains(key) then return nil end
        index = @keys.index(key)
        old_value = getValue(key)
        
        @values[index] = value

        if old_value < value then 
            sink(index, @size)
        else
            swim(index)
        end
    end
    
    def swim (k)
        while k > 1 and @values[k] < @values[k / 2]
            exchKeyValue(@keys, @values, k, k / 2)
            k = k / 2
        end
    end

    def sink (k, n)
        while (k <= n) and ((k * 2 <= n and @values[k] > @values[k * 2]) or (k * 2 + 1 <= n and @values[k] < @values[k * 2 + 1]))
            if k * 2 + 1 <= n and  @values[k * 2 + 1] < @values[k * 2]
                exchKeyValue(@keys, @values, k, k * 2 + 1)
                k = k * 2 + 1
            else
                exchKeyValue(@keys, @values, k, k * 2)
                k = k * 2
            end 
        end  
    end
end
