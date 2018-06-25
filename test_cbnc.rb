require "minitest/autorun"
require_relative "cbnc.rb"

class TestPizzaApp < Minitest::Test
    def test_assert_1_equals_1
        assert_equal(1, 1)
    end

    def test_match_returns_integer
        assert_equal(Integer, match_check("","").class)
    end

    def test_no_match_returns_0
        assert_equal(0, match_check("5678", "1234"))
    end

    def test_1_match_returns_1
        assert_equal(1, match_check("1234", "1555"))
    end

    def test_4_match_returns_4
        assert_equal(4, match_check("1234", "1234"))
    end

    def test_invalid_input_returns_0
        assert_equal(0, match_check(3214, "3214"))
        assert_equal(0, match_check(["3214"], "3214"))
    end

    def test_check_list_returns_array
        assert_equal(Array, check_list(['']).class)
    end
end