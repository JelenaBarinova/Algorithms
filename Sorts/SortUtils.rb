#SortUtils

def less (v, w)
	return v < w
end

def exch (array,i, j)
	swap = array[i]
	array[i] = array[j]
	array[j] = swap
end

module Enumerable
  def sorted?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end
end