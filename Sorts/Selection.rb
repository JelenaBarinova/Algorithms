#Selection of K biggest elemnt
require_relative 'QuickSort'

def Selection (array, k)
    if k > array.size - 1 or k < 0 then return nil end
    lo = 0
    hi = array.size - 1
    
    while lo < hi
        partition = Partition(array, lo, hi)
        if k > partition then
            lo = partition + 1
        elsif k < partition then
            hi = hi - 1
        else
            return array[partition]
        end 
    end
end

array = [1, 8, 3, 5]
puts array.to_s

puts Selection(array, 3)


