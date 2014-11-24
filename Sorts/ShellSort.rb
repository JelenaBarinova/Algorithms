#ShellSort
require_relative 'SortUtils'

def ShellSort (array)
    if array.empty? then return nil end
    if array.size == 1 then return array
    else
        n = array.size()
        h = 1
        while h < n / 3
            h = h * 3 +1 
        end

        while h > 0
            i = 0
            for i in 0..n - 1
                index = i
                j = i
                while j >= 0
                    if array[index] < array [j] then
                        exch(array, index, j)
                        index = j
                    end
                    j -= h
                end               
                i += 1
            end
            h = h / 3
        end
        return array
    end
end