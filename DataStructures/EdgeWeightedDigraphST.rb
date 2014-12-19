require_relative 'EdgeWeightedDigraph'

class ST
    attr_accessor :edgeTo, :distTo

    def initialize (graph, s)
        @graph = graph
        @root = s
        @edgeTo = Array.new(graph.vertices)
        @distTo = Array.new(graph.vertices)
        calcPath(graph, s)
    end

    def calcPath (graph, s)
        
    end

    def hasPath (v)
        return !@distTo[v].nil?
    end

    def dist (v)
        if !hasPath(v) then return nil end
        return @distTo[v]
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