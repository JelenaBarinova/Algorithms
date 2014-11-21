#SelectionSort
def Sort (array)
	if array.empty? then return nil
	elsif array.size == 1 then return array
	else
		for i in 0..array.size - 1
			min_index = i
			for j in i + 1..array.size - 1
				if array[j] < array[min_index] then min_index = j end
				j += 1
			end
			tmp = array[i]
			array[i] = array[min_index]
			array[min_index] = tmp
			i += 1
		end
		return array
	end
end