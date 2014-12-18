#Graph
class Graph
    attr_accessor :vertices, :edges

    def initialize (vertices)
        @vertices = vertices
        @edges = 0
        @adj = Array.new(@vertices)
        for i in 0..@vertices-1
            @adj[i] = Array.new()
        end
    end

    def addEdge (v, w)
        @adj[v] << w
        @adj[w] << v
        @edges += 1
    end 

    def adj (v)
        return @adj[v]
    end
end