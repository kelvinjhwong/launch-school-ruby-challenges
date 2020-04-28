=begin

**Line 22**
* The game should've been stopped after this. There should be
  a `break` keyword inserted between lines 22 and 23
* Otherwise, currently the player has to play through all
  attempts even if they get it right the first time

**Line 28**
* This turns `guess_number` into a recursive method.
* The effect is that if the first guess is wrong, then the
  method is invoked again with the same arguments, which
  creates a new 'inner game', where there's a new winning
  number, and the number of attempts is reset to 0.
* This pattern keeps on recurring, potentially creating
  an infinite stack of inner games, with the only `break`
  condition being the player exhausting all their attempts,
  and getting the number right on every attempt (to avoid
  creating yet another new inner game).

=end

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)