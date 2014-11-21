#BubbleSort
def BubbleSort (array=nil)
	if array.nil? then return nil end

	if array.empty? then return nil end
	if array.size == 1 then return array
	else
		i = 0
		for i in 0..array.size() - 1
			for j in 1..array.size() - 1 - i
				if array[j - 1] > array[j] then
					tmp = array[j - 1]
					array[j - 1] = array[j]
					array[j] = tmp
				end
				j += 1
			end
			i += 1
		end
		return array
	end
end