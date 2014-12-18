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
        v = graph.adj(s)
        for i in 0..v.size() - 1
            if !@marked[v[i]] then
                @edgeTo[v[i]] = s
                dfsIn(graph, v[i])
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
            pathStack << i
            i = @edgeTo[i]
        end
        pathStack << @root
        return pathStack
    end
end