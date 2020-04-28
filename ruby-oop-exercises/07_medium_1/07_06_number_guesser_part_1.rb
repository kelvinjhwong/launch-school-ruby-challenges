class GuessingGame
  def initialize
    @right_number = nil
    @number_of_guesses = nil
    @guess = nil
  end
  
  def play
    reset_game #reset number, number_of_guesses
    loop do
      display_number_of_guesses
      get_number_guess
      decrement_number_of_guesses
      display_comparison_with_right_number
      break if correct_guess? || no_more_guesses?
    end
    display_result
  end
  
  private
  
  attr_reader :right_number
  attr_accessor :number_of_guesses, :guess
  
  def reset_game
    @right_number = (1..100).to_a.sample
    @number_of_guesses = 7
    @guess = nil
  end
  
  def display_number_of_guesses
    puts "You have #{number_of_guesses} guesses remaining."
  end
  
  def get_number_guess
    num_str = ''
    loop do
      print "Enter a number between 1 and 100: "
      num_str = gets.chomp
      break if ('1'..'100').include? num_str
      print 'Invalid guess. '
    end
    self.guess = num_str.to_i
  end
  
  def display_comparison_with_right_number
    case guess <=> right_number
    when 1 then puts 'Your guess is too high.'
    when -1 then puts 'Your guess is too low.'
    when 0 then puts "That's the number!"
    end
    puts
  end
  
  def correct_guess?
    guess == right_number
  end
  
  def no_more_guesses?
    number_of_guesses == 0
  end
  
  def decrement_number_of_guesses
    self.number_of_guesses = number_of_guesses - 1
  end
  
  def display_result
    puts correct_guess? ? 'You won!' : 'You have no more guesses. You lost!'
  end
end

game = GuessingGame.new
game.play