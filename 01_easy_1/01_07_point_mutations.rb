=begin

***Did not watch solution video***

Input
- 2 Strings with chars 'C', 'A', 'G' or 'T'
- May be empty
- May be of different lengths

Output
- Integer
- The total number of index positions, up to last char of the shorter
  input String, at which the chars in the 2 input Strings are different

Examples / edge cases / extra assumptions
- 2 empty strands => 0
- Identical strands => 0
- Should not mutate either input Strings
- Assume all input Strings have only 'C', 'A', 'G' and 'T' as chars

Algorithm / data structure
- Identify the shorter string
- Iterate through shorter string's chars, with index and reduce
 - If same char at this index, return memo + 1, else memo
 - ***Check for case where strings are empty, may need guard clause***

=end

class DNA
  def initialize(strand)
    @strand = strand
  end
  
  # def hamming_distance(other_strand)
  #   shorter_strand = strand.length <= other_strand.length ? strand : other_strand
  #   longer_strand = shorter_strand == strand ? other_strand : strand
    
  #   shorter_strand.each_char.with_index.reduce(0) do |distance, (char, idx)|
  #     char == longer_strand[idx] ? distance : distance + 1
  #   end
  # end
  
  def hamming_distance(other_strand)
    shorter, longer = [strand, other_strand].sort_by(&:length)

    shorter.each_char.with_index.reduce(0) do |distance, (char, idx)|
      char == longer[idx] ? distance : distance + 1
    end
  end
  
  private
  
  attr_reader :strand
end
