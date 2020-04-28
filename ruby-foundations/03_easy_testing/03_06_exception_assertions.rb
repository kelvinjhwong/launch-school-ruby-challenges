require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError
end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionTest < Minitest::Test
  attr_reader :employee
  
  def setup
    @employee = Employee.new
  end
  
  def test_no_experience_error
    assert_raises(NoExperienceError) { employee.hire }
  end
end
