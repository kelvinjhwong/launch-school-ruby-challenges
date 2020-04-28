require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedObjectTest < Minitest::Test
  attr_reader :list
  
  def setup
    @list = ['xyz']
  end
  
  def test_included_object
    assert_includes(list, 'xyz')
    # assert_equal(true, list.include?('xyz'))
  end
end