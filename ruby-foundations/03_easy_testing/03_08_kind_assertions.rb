require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test
  attr_reader :value
  
  def setup
    @value = 3
  end
  
  def test_kind
    assert_kind_of(Numeric, value)
  end
end
