    # helper functions
    def populate_graph_from_file (file_name)
        file = File.new(file_name, "r")
        vertices = file.gets.to_i
        edges = file.gets

        graph = Graph.new(vertices)
        while (line = file.gets)
            edge = line.split(" ")
            graph.addEdge(edge[0].to_i, edge[1].to_i)
        end
        file.close
        return graph
    end

    def populate_edge_weighted_digraph_from_file (file_name)
        file = File.new(file_name, "r")
        vertices = file.gets.to_i
        edges = file.gets

        graph = EdgeWeightedDigraph.new(vertices)
        while (line = file.gets)
            edge = line.split(" ")
            graph.addEdge(edge[0].to_i, edge[1].to_i, edge[2].to_f)
        end
        file.close
        return graph
    end
