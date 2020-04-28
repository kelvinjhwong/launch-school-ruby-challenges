def staggered_case(string)
  case_toggle = true
  string.chars.each do |char|
    next if char =~ /[^a-z]/i
    case_toggle ? char.upcase! : char.downcase!
    case_toggle = !case_toggle
  end.join
end

def staggered_case(string, ignore_case = true)
  case_toggle = true
  string.chars.each do |char|
    next if ignore_case && char =~ /[^a-z]/i
    case_toggle ? char.upcase! : char.downcase!
    case_toggle = !case_toggle
  end.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

staggered_case('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS', false) == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'
