require_relative '../Sorts/SortUtils.rb'
class KeyValueBasePQ
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

    def delete ()
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

    def upsert (key, value)
        if self.contains(key) then 
            updateValue(key, value)
        else
            insert(key, value)
        end
    end

    def isEmpty ()
        return @size == 0
    end

    def size ()
        return @size
    end

    def contains (key)
        for i in 1..@size
            if @keys[i] == key then
                return true
            end
        end
        return false
    end

    def getValue (key)
        if !contains(key) then return nil end
        for i in 1..@size
            if @keys[i] == key then
                return @values[i]
            end
        end
    end
end