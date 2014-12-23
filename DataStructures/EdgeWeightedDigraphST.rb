require_relative 'EdgeWeightedDigraph'
require_relative 'PriorityQueueKeyValue'
#topological sort
#dijkstra
#edge weighted dag
class ST
    attr_accessor :edgeTo, :distTo

    def initialize (graph, s)
        @graph = graph
        @root = s
        @edgeTo = Array.new(graph.vertices)
        @distTo = Array.new(graph.vertices)
        @queue = KeyValuePQ.new() #vertices to visit
        calcPaths(graph, s)
    end

    #Dijkstra
    def calcPaths (graph, s)
        for i in 0..graph.vertices - 1
            @distTo[i] = Float::INFINITY
        end
        @distTo[s] = 0.0
        @queue.insert(s, 0.0)

        while !@queue.isEmpty()
            v = @queue.deleteMin()[0]
            
            graph.adj(v).each {|e| relax(e)}
        end
    end

    def relax (e)
        v = e.from()
        w = e.to()
        if distTo[w] > distTo[v] + e.weight()
            distTo[w] = distTo[v] + e.weight()
            edgeTo[w] = e

            if @queue.contains(w) then 
                @queue.updateValue(w, distTo[v] + e.weight())
            else
                @queue.insert(w, distTo[v] + e.weight())
            end
        end
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
            i = @edgeTo[i].from()
        end
        pathStack.push(@root)
        return pathStack
    end
end