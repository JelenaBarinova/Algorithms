require_relative 'Graph'
require_relative 'DFS'
require "test/unit"


class TestGraph < Test::Unit::TestCase
    def setup

    end

    # test new()
    def test_new_vertices_count_equals_13_for_digraph1
        @g = populate_graph_from_file("TestGraphs/digraph1.txt")

        res = @g.vertices

        assert_equal(13, res)
    end

    # test adj()
    def test_adj_returns_1910_for_vertice_5_for_digraph1
        @g = populate_graph_from_file("TestGraphs/digraph1.txt")

        res = @g.adj(5)

        assert_equal([1, 9, 10], res)
    end

    # test dfs()
    def test_dfs_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        dfs = DFS.new(@g, 0)
        
        res = dfs.edgeTo

        assert_equal([nil, 0, 0, 1, 1, 1, nil, 3, 3, 5, 5, 10, 10], res)
    end

    def test_hasPath_returns_true_for_existing_path_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        dfs = DFS.new(@g, 0)

        res = dfs.hasPath(7)

        assert_equal(true, res)
    end
    def test_hasPath_returns_false_for_nonexisting_path_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        dfs = DFS.new(@g, 0)

        res = dfs.hasPath(6)

        assert_equal(false, res)
    end

    # test path
    def test_path_returns_nil_when_no_path_to_vertex_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        dfs = DFS.new(@g, 0)

        res = dfs.path(6)

        assert_equal(nil, res)
    end
    def test_path_returns_correct_path_to_vertex_0_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        dfs = DFS.new(@g, 0)

        res = dfs.path(12)

        assert_equal([12, 10, 5, 1, 0], res)
    end
    def test_path_returns_correct_path_to_vertex_8_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        dfs = DFS.new(@g, 8)

        res = dfs.path(11)

        assert_equal([11, 10, 5, 1, 3, 8], res)
    end

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
end