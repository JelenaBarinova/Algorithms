require_relative 'EdgeWeightedDigraph'
require_relative 'GraphUtils'

require "test/unit"

class TestEdgeWeightedDigraph < Test::Unit::TestCase
    def setup

    end

    # test new()
    def test_new_vertices_count_equals_8_for_weighted_digraph1
        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph1.txt")

        res = @g.vertices

        assert_equal(8, res)
    end

    def test_new_edge_count_equals_15_for_weighted_digraph1
        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph1.txt")

        res = @g.vertices

        assert_equal(8, res)
    end

    # test adj()
    def test_adj_returns_471_for_vertice_5_for_weighted_digraph1
        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph1.txt")

        res = []
        @g.adj(5).each {|e| res << e.to()}

        assert_equal([4, 7, 1], res)
    end
end