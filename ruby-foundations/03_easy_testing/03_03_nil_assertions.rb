require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test
  attr_reader :value
  
  def setup
    @value = 3
  end
  
  def test_nil
    # assert_equal(nil, value)
    assert_nil(value)
  end
end
