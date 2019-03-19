# ***Did not watch solution video***

class House
  def self.recite
    (1..NUMBER_OF_VERSES).map do |verse_num|
      new.generate_verse(verse_num)
    end.join("\n")
  end

  def generate_verse(verse_num)
    'This is ' + pieces[-verse_num..-1].map do |phrases|
      phrases.join("\n")
    end.join(' ') + ".\n"
  end
  
  private
  
  NUMBER_OF_VERSES = 12

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end