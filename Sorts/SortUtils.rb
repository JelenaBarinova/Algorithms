#SortUtils

def less (v, w)
	return v < w
end

def exch (array,i, j)
	swap = array[i]
	array[i] = array[j]
	array[j] = swap
end