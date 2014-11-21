#SelectionSort
require_relative 'SortUtils'

def SelectionSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        for i in 0..array.size - 1
            min_index = i
            for j in i + 1..array.size - 1
                if array[j] < array[min_index] then min_index = j end
                j += 1
            end
            exch(array, i, min_index)
            i += 1
        end
        return array
    end
end