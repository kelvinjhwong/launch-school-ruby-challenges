require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyObjectTest < Minitest::Test
  attr_reader :list
  
  def setup
    @list = []
  end
  
  def test_empty
    assert_empty(list)
    # assert_equal(true, list.empty?)
  end
end
