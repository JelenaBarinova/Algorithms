require_relative 'Graph'
require_relative 'GraphUtils'

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
end