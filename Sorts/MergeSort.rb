#MergeSort
require_relative 'SortUtils'

def MergeSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        n = array.size
        aux = Array.new(n)
        return Sort(aux, array, 0, n - 1)
    end
end

def Sort (aux, array, lo, hi)
    if lo >= hi then return nil end
    
    mid = lo + (hi - lo) / 2

    Sort(aux, array, lo, mid)
    Sort(aux, array, mid + 1, hi)
    Merge(aux, array, lo, mid, hi)
    
    return array 
end

def Merge (aux, array, lo, mid, hi)
    i = lo
    while i <= hi
        aux[i] = array[i]
        i += 1
    end
    i = lo
    j = mid + 1
    k = lo
    while k <= hi
        if i > mid then 
            array[k] = aux[j]
            j += 1
            elsif j > hi then
                array[k] = aux[i]
                i += 1
                elsif aux[i] > aux[j] then
                    array[k] = aux[j]
                    j += 1
                    else 
                        array[k] = aux[i]
                        i += 1
        end
        k += 1
    end
end