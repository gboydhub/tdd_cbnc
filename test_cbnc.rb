require "minitest/autorun"
require_relative "cbnc.rb"

class TestPizzaApp < Minitest::Test
    def test_assert_1_equals_1
        assert_equal(1, 1)
    end

    def test_match_returns_boolean
        assert_equal(Integer, match_check("","").class)
    end
end