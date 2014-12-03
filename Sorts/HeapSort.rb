#HeapSort
require_relative 'SortUtils'
require_relative '../DataStructures/PriorityQueue.rb'

def HeapSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        pq = FormHeapTree(array)
        array = HSort(pq)
        return array
    end
end

def FormHeapTree (array)
    pq = MaxPQ.new()
    for i in 0..array.size - 1
        pq.insert(array[i])
    end
    return pq
end

def HSort (pq)
    n = pq.size()
    while n > 1
        exch(pq.keys, 1, n)
        n -= 1
        pq.sink(1, n)
    end
    array = pq.keys 
    array.shift
    return array
end
