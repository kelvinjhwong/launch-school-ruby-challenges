=begin

Input:
- Integer
- < 3,000 (so only 4 or fewer digits)

Output:
- String
- Roman numerals

Examples / edge cases / extra assumptions
- Input is positive Integer
- Won't validate input

Algorithm:

I
II
III
IV
V
VI
VII
VIII
IX
X

X
XX
XXX
XL
L
LX
LXX
LXXX
XC
C

C
CC
CCC
CD
D
DC
DCC
DCCC
CM
M

- '1' => [1] => ['I'] ==> 'I'
- '80' => [5, 1, 1, 1], 1st place => ['L', 'X', 'X', 'X'] => 'LXXX'
- '300' => [1, 1, 1], 2nd place => ['C', 'C', 'C'] => 'CCC'

- Convert input Integer to Array of Integer digits
- Convert each digit to the right combo of 1s and 5s
- Convert each combo of 1s and 5s to Roman numerals, then join
- Iteratively push all resultant Roman numerals into a String, starting from the
  highest place

=end

class Integer
  def to_roman
    digits = to_s.chars.map(&:to_i)
    num_length = digits.size
    
    digits.each_with_index.reduce('') do |roman, (digit, idx)|
      roman + digit_to_roman(digit, num_length - idx - 1)
    end
  end
  
  private
  
  NUMERAL_TRIPLETS = [
    { 1 => 'I', 5 => 'V', 10 => 'X' },
    { 1 => 'X', 5 => 'L', 10 => 'C' },
    { 1 => 'C', 5 => 'D', 10 => 'M' },
    { 1 => 'M'}
    ]
  
  DIGIT_TO_NUMERAL_DIGITS = [
    [],
    [1],
    [1, 1],
    [1, 1, 1],
    [1, 5],
    [5],
    [5, 1],
    [5, 1, 1],
    [5, 1, 1, 1],
    [1, 10]
    ]
      
  def digit_to_roman(digit, place)
    DIGIT_TO_NUMERAL_DIGITS[digit].map do |numeral_digit|
      NUMERAL_TRIPLETS[place][numeral_digit]
    end.join
  end
end
