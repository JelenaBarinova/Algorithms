require_relative 'Graph'

class BFS
    attr_accessor :edgeTo

    def initialize (graph, s)
        @graph = graph
        @root = s
        @marked = Array.new(graph.vertices)
        @edgeTo = Array.new(graph.vertices)
        bfsIn(graph, s)
    end

    def bfsIn (graph, s)
        edgesQueue = Array.new()
        edgesQueue << s #enqueue
        while !edgesQueue.empty? 
            i = edgesQueue.shift #dequeue
            @marked[i] = true
            adj = graph.adj(i)
            for j in 0..adj.size - 1
                if !@marked[adj[j]] then 
                    edgesQueue << adj[j]
                    @edgeTo[adj[j]] = i
                end
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