require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityTest < Minitest::Test
  attr_reader :value
  
  def test_downcase
    @value = 'xyz'
    assert_equal('xyz', value.downcase)
  end
end