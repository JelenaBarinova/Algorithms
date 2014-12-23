class Edge
    def initialize (v, w, weight)
        @from = v
        @to = w
        @weight = weight
    end

    def from ()
        return @from
    end

    def to ()
        return @to
    end

    def weight ()
        return @weight
    end
end

class EdgeWeightedDigraph
    attr_accessor :vertices, :edges

    def initialize (vertices)
        @vertices = vertices
        @edges = 0
        @adj = Array.new(@vertices)
        for i in 0..@vertices-1
            @adj[i] = Array.new()
        end
    end

    def addEdge (v, w, weight)
        edge = Edge.new(v, w, weight)
        @adj[v] << edge
        @edges += 1
    end 

    def adj (v)
        return @adj[v]
        #tmp = Array.new()
        #@adj[v].each {|i| tmp << i}
        #return tmp
    end
end