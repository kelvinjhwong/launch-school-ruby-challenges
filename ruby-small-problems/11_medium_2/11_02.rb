# Store all spelling blocks in a hash
# Downcase argument
# Duplicate spelling blocks
# Iterate through argument's characters
#   Delete the block whose key or value is the character
#   Return false if such a block no longer exists
# Return true

SPELLING_BLOCKS = {'B'=>'O', 'X'=>'K', 'D'=>'Q', 'C'=>'P',
                   'N'=>'A', 'G'=>'T', 'R'=>'E', 'F'=>'S',
                   'J'=>'W', 'H'=>'U', 'V'=>'I', 'L'=>'Y',
                   'Z'=>'M'}

def block_word?(word)
  spelling_blocks = SPELLING_BLOCKS.dup
  word.upcase.each_char do |char|
    if spelling_blocks.has_key? char
      spelling_blocks.delete(char)
    elsif spelling_blocks.has_value? char
      spelling_blocks.delete(spelling_blocks.key(char))
    else
      return false
    end
  end
  true
end

SPELLING_BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  SPELLING_BLOCKS.none? { |block| word.upcase.count(block) >= 2 }
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
