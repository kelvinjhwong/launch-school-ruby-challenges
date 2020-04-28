GRADES = {(0..59) => 'F', (60..69) => 'D', (70..79) => 'C',
          (80..89) => 'B', (90..100) => 'A'}

def get_grade(score1, score2, score3)
  avg = (score1 + score2 + score3)/3
  GRADES.select { |result, grade| result.include?(avg) }.values[0]
end

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
