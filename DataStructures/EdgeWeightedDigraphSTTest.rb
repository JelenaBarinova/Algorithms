require_relative 'EdgeWeightedDigraph'
require_relative 'GraphUtils'
require_relative 'EdgeWeightedDigraphST'
require "test/unit"


class TestST < Test::Unit::TestCase
    def setup

    end
    
    # test dfs()
    def test_st_for_digraph2_from_0_vertex

        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph2.txt")

        st = ST.new(@g, 0)
        
        res = []
        st.edgeTo.compact.each {|e| res << e.from()}

        assert_equal([0, 5, 2, 0, 4, 2, 0], res)
    end

    def test_path_for_digraph2_from_0_to_5

        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph2.txt")

        st = ST.new(@g, 0)
        
        res = []
        st.path(5).each {|e| res << e}

        assert_equal([5, 4, 0], res)
    end

    def test_dist_for_digraph2_from_0_to_6

        @g = populate_edge_weighted_digraph_from_file("TestGraphs/weighteddigraph2.txt")

        st = ST.new(@g, 0)
        
        res = st.dist(6)

        assert_equal(25, res)
    end
end