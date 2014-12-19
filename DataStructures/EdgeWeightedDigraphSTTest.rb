require_relative 'EdgeWeightedDigraph'
require_relative 'GraphUtils'
require_relative 'EdgeWeightedDigraphST'
require "test/unit"


class TestST < Test::Unit::TestCase
    def setup

    end
    
    # test dfs()
    def test_st_for_digraph1

        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph1.txt")

        st = ST.new(@g, 0)
        res = st.edgeTo

        assert_equal([nil, 0, 0, 1, 1, 1, nil, 3, 3, 5, 5, 10, 10], res)
    end
end