require "minitest/autorun"
require_relative "cbnc.rb"

class TestCBNC < Minitest::Test
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
        assert_equal(Array, check_list([''], '').class)
    end

    def test_check_list_returns_0_winners
        assert_equal([0], check_list(['1234'], '7777'))
    end

    def test_check_list_returns_1_winner
        assert_equal([4, 0], check_list(['1234', '2345'], '1234'))
    end

    def test_check_3_winners_from_5
        list = ['1234', '1234', '1255', '4321', '1234']
        assert_equal([4, 4, 2, 0, 4], check_list(list, '1234'))
    end

    def test_check_list_winners_returns_array
        assert_equal(Array, get_total_winners([],[]).class)
    end

    def test_get_winners_array_is_hash
        assert_equal(Hash, get_total_winners([''],[''])[0].class)
    end

    def test_get_winners_data
        assert_equal([{0 => 1}], get_total_winners(['1234'], ['1555']))
    end

    def test_get_winners_multiple_tickets
        assert_equal([{0 => 2, 1 => 1}], get_total_winners(['1234', '1325'], ['1277']))
    end

    def test_get_winners_multiple_winners
        assert_equal([{0 => 1}, {0 => 2}], get_total_winners(['1234'], ['1555', '1255']))
    end
end