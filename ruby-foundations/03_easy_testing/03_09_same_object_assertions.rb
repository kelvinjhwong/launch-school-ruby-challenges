require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    self
  end
end

class SameObjectTest < Minitest::Test
  attr_reader :list
  
  def setup
    @list = List.new
  end
  
  def test_same
    assert_same(list, list.process)
  end
end
