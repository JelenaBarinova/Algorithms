#MergeSort
require_relative 'SortUtils'

def RadixSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        return array
    end
end

def Sort ()
    return array 
end

#trying out key-index counting 
R = 10
array = Array.new(100.times.map{ Random.rand(R) })

puts "before sort: " + array.to_s

N = array.size
aux = Array.new(N)
count = Array.new(R)

for i in 0..N - 1 
    count[array[i] + 1] = count[array[i] + 1].to_i + 1 #to_i used for nils to be used as 0
end
#puts "count array: " + count.to_s

count[0] = 0
for i in 0..R - 1
    count[i + 1] = count[i + 1].to_i + count[i].to_i
end
#puts "count array: " + count.to_s

for i in 0..N - 1
    aux[count[array[i]]] = array[i]
    count[array[i]] += 1   
end

#for i in 0..N - 1
#    array[i] = aux[i]
#end

puts "after sort:  " + aux.to_s
puts aux == array.sort()
