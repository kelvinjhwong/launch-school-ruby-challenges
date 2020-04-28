require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedObjectTest < Minitest::Test
  attr_reader :list
  
  def setup
    @list = []
  end
  
  def test_included_object
    refute_includes(list, 'xyz')
  end
end
