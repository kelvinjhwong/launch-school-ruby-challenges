require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class BooleanTest < Minitest::Test
  attr_accessor :value
  
  def setup
    @value = 4
  end
  
  def test_odd
    # assert_equal(true, value.odd?)
    assert value.odd?, 'Value is not odd'
  end
end
