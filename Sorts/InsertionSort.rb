#InsertionSort
require_relative 'SortUtils'

def InsertionSort (array)
	if array.empty? then return nil end
	if array.size == 1 then return array
	else
		i = 0
		for i in 0..array.size() - 1
			index = i
			i.downto(0) do |j|
				if array[index] < array[j] then 
					exch(array, index, j) 
					index -= 1
				end
			end 
			i += 1
		end
		return array
	end
end