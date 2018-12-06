require_relative "exercise"
require "test/unit"

class TestExercise < Test::Unit::TestCase
  setup do
    @mcd = Exercise.new
  end

  test 'case base' do
    assert_equal(14, @mcd.find_multiple(42, 56, 14))
  end

  test 'find single mcd' do
    assert_equal({'2' => 1, '7' => 1}, @mcd.find_single_mdc(14))
    assert_equal({'3' => 2}, @mcd.find_single_mdc(9))
    assert_equal({'2' => 1, '3' => 1, '5' => 1}, @mcd.find_single_mdc(30))
  end

  test 'intersection mcd' do
    assert_equal({'2' => 1, '7' => 1}, intesect(14,14))
    assert_equal({'3' => 2}, intesect(27,18))
    assert_equal({}, intesect(14,15))
  end

  test 'from map to integer' do
    assert_equal(14, @mcd.map_to_integer({'2' => 1, '7' => 1}))
    assert_equal(1, @mcd.map_to_integer({}))
  end

  def intesect(val1,val2)
    @mcd.intersect_mcd(@mcd.find_single_mdc(val1), @mcd.find_single_mdc(val2))
  end
end
