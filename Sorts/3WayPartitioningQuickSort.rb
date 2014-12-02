#QuickSort
require_relative 'SortUtils'

def ThreeWayPartitioningQuickSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        n = array.size
        array = array.shuffle
        SortT(array, 0, n -1)
        return array
    end
end

def PartitionT (array, lo, hi)
    fi = lo
    li = hi
    i = lo
    partition_key = array[lo]
    
    while i <= li
        if partition_key > array[i] then 
            exch(array, i, fi)
            fi += 1 
            i += 1
        elsif partition_key == array[i] then
            i += 1
        elsif partition_key < array[li] then 
            li -= 1 
        elsif partition_key >= array [li] then
            exch(array, i, li)
            li -= 1
        end
    end
    return fi, li

end

def SortT (array, lo, hi)
    if lo >= hi then return nil end
    partition = PartitionT(array, lo, hi)
    SortT(array, lo, partition[0] - 1)
    SortT(array, partition[1] + 1, hi)
    return array
end
