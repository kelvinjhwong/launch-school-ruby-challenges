LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

NAMES = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

def decrypt_rot13(text)
  text.chars.map do |char|
    case char
    when /[a-z]/ then LOWERCASE.rotate(13)[LOWERCASE.index(char)]
    when /[A-Z]/ then UPPERCASE.rotate(13)[UPPERCASE.index(char)]
    else              char
    end
  end.join
end

NAMES.each { |name| puts decrypt_rot13(name) }
