require_relative 'Graph'

class DFS
    attr_accessor :edgeTo

    def initialize (graph, s)
        @graph = graph
        @root = s
        @marked = Array.new(graph.vertices)
        @edgeTo = Array.new(graph.vertices)
        dfsIn(graph, s)
    end

    def dfsIn (graph, s)
        @marked[s] = true
        graph.adj(s).each do |i|
            if !@marked[i] then
                @edgeTo[i] = s
                dfsIn(graph, i)
            end
        end
    end

    def hasPath (v)
        return @marked[v] == true
    end

    def path (v)
        if !hasPath(v) then return nil end
        pathStack = Array.new()
        i = v
        while i != @root
            pathStack.push(i)
            i = @edgeTo[i]
        end
        pathStack.push(@root)
        return pathStack
    end
end