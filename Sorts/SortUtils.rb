#SortUtils

def less (v, w)
    return v < w
end

def exch (array,i, j)
    swap = array[i]
    array[i] = array[j]
    array[j] = swap
end

def exchKeyValue (keys, values, i, j)
    swap = keys[i]
    keys[i] = keys[j]
    keys[j] = swap

    swap = values[i]
    values[i] = values[j]
    values[j] = swap
end

module Enumerable
  def sorted?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end

  def shuffle
    each {|i| exch(array, i , Random.rand(i))}
  end
end