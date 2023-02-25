require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    car = Car.new
    assert_equal(3, car.wheels)
  end

  def test_skip_bad_wheels
    skip "Ain't nobody got time for this"
    car = Car.new
    assert_equal(6, car.wheels)
  end
end