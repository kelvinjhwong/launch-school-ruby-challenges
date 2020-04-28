require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  attr_reader :value
  
  def setup
    @value = Numeric.new
  end
  
  def test_class
    assert_instance_of(Numeric, value)
  end
end
