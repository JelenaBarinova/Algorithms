#QuickSort
require_relative 'SortUtils'

def QuickSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        n = array.size
        array = array.shuffle
        SortQ(array, 0, n -1)
        return array
    end
end

def Partition (array, lo, hi)
    k = lo
    i = lo
    j = hi
    while 1 == 1 
        break if j < lo
        break if i > hi
        if array[k] >= array[i] then i += 1 
        elsif array[k] < array[j] then j -= 1 
        else 
            exch(array, i, j)
            i += 1
            j -= 1 
        end
        break if j < i
    end
    exch(array, k, j)
    return j
end

def SortQ (array, lo, hi)
    if lo >= hi then return nil end

    partition = Partition(array, lo, hi)
    SortQ(array, lo, partition - 1)
    SortQ(array, partition + 1, hi)
    return array
end
