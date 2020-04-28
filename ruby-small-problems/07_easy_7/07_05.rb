def staggered_case(string)
  string.chars.each_with_index do |char, idx|
    idx.even? ? char.upcase! : char.downcase!
  end.join
end

def staggered_case(string, first_letter_case = 'upper')
  string.chars.each_with_index do |char, idx|
    if first_letter_case == 'upper'
      idx.even? ? char.upcase! : char.downcase!
    elsif first_letter_case == 'lower'
      idx.even? ? char.downcase! : char.upcase!
    end
  end.join
end

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
