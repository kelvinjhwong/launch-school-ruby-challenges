=begin
***Did not watch solution video***
Input:


Output:


Examples / edge cases / assumptions:
- Invalid codon - not a String object that contains one the
  specified 3-uppercase-letter combo? Raise InvalidCodonError

Algorithm:
- Codon --> amino acid: simple hash value retrieval by key
- RNA --> strand:
  - Split codons into Array of codons
  - Translate each codon into amino acid
  - Break when hit the first STOP

=end

class Translation
  def self.of_codon(codon)
    # CODONS_TO_AMINO_ACIDS[codon] || raise(InvalidCodonError, 'Invalid Codon!')
    CODONS_TO_AMINO_ACIDS.fetch(codon) do |invalid_codon|
      raise(InvalidCodonError, '#{invalid_codon} is an invalid codon!')
    end
  end
  
  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |codon, proteins|
      amino_acid = of_codon(codon)
      return proteins if amino_acid == 'STOP'
      proteins << amino_acid
    end
  end
  
  private
  
  CODONS_TO_AMINO_ACIDS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }
end

class InvalidCodonError < StandardError; end