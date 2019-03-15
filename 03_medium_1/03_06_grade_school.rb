# Did not watch solution video

class School
  def initialize
    @students_ordered_by_grade = Hash.new do |hash, grade_num|
      hash[grade_num] = []
    end
  end
  
  def to_h
    students_ordered_by_grade.sort.to_h
  end
  
  def add(student_name, grade_num)
    students_ordered_by_grade[grade_num].push(student_name).sort!
  end
  
  def grade(grade_num)
    students_ordered_by_grade[grade_num]
  end
  
  private
  
  attr_accessor :students_ordered_by_grade
end
