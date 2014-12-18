require_relative 'Graph'
require_relative 'GraphUtils'
require_relative 'BFS'
require "test/unit"


class TestGraph < Test::Unit::TestCase
    def setup

    end

    # test dfs()
    def test_dfs_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        bfs = BFS.new(@g, 0)
        
        res = bfs.edgeTo

        assert_equal([nil, 0, 0, 1, 1, 1, nil, 3, 3, 5, 5, 10, 10], res)
    end
    def test_hasPath_returns_true_for_existing_path_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        bfs = BFS.new(@g, 0)

        res = bfs.hasPath(7)

        assert_equal(true, res)
    end
    def test_hasPath_returns_false_for_nonexisting_path_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        bfs = BFS.new(@g, 0)

        res = bfs.hasPath(6)

        assert_equal(false, res)
    end

    # test path
    def test_path_returns_nil_when_no_path_to_vertex_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        bfs = BFS.new(@g, 0)

        res = bfs.path(6)

        assert_equal(nil, res)
    end
    def test_path_returns_correct_path_to_vertex_0_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        bfs = BFS.new(@g, 0)

        res = bfs.path(12)

        assert_equal([12, 10, 5, 1, 0], res)
    end
    def test_path_returns_correct_path_to_vertex_8_for_digraph1

        @g = populate_graph_from_file("TestGraphs/digraph1.txt")
        bfs = BFS.new(@g, 8)

        res = bfs.path(11)

        assert_equal([11, 10, 5, 1, 3, 8], res)
    end
end