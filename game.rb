# computer for now
class Codemaker
  attr_accessor :feedback

  def initialize
    @feedback = ['', '', '', '']
  end

  def create_feedback(guess, code)
    guess.each_with_index do |color, i|
      if color == code[i]
        feedback[i] = "#{color} is correct"
      end
    end
    guess.each_with_index do |color, i|
      if code.include?(color) && code.count(color) > feedback.count { |comment| comment.start_with?(color) } && feedback[i] != "#{color} is correct"
        feedback[i] = "#{color} is present"
      elsif feedback[i] == ''
        feedback[i] = 'Not here'
      end
    end
  end

  def player_create_feedback
    @feedback = []
    feedback.push(gets.chomp) while feedback.length < 4
  end

  def clear_feedback
    @feedback = ['', '', '', '']
  end
end

# player for now
class Codebreaker
  attr_accessor :guess, :guess_number, :last_guess

  def initialize
    @guess = []
    @guess_number = 0
    @last_guess = ['', '', '', '']
  end

  def create_guess
    guess.push(gets.chomp) while guess.length < 4
  end

  # This computer creates and keeps correct guesses.
  def create_guess_comp(feedback, colours)
    if @guess_number == 0
      guess.push(colours[rand(6)]) while guess.length < 4
    else
      last_guess.each_with_index do |color, i|
       if feedback[i].include?('correct')
         guess[i] = color
       end
      end
      last_guess.each_with_index do |color, i|
        if feedback[i].include?('present') && feedback.count{ |comment| comment.start_with?(color) } > guess.count(color)
         guess[i] = colours[rand(6)]
         j = i
         # ensures j is neither this index or overwriting a correct one
         j = rand(4) while i == j || feedback[j].include?('correct')
         guess[j] = last_guess[i]
        elsif feedback[i] == 'Not here'
          guess[i] = colours[rand(6)]
        end
      end
    end
    @guess_number += 1
  end

  def clear_guess
    @last_guess = @guess
    @guess = []
  end
end

# code-making class
class SecretCode
  attr_reader :colours
  attr_accessor :code

  def initialize
    @colours = ['red', 'blue', 'green', 'yellow', 'orange', 'purple']
    @code = []
  end

  def create_code
    code.push(colours[rand(6)]) while code.length < 4
  end
end

secret_code = SecretCode.new
setter = Codemaker.new
guesser = Codebreaker.new
secret_code.create_code
code = secret_code.code

human_player = gets.chomp

if human_player == 'setter'
  while setter.feedback != ["#{code[0]} is correct", "#{code[1]} is correct", "#{code[2]} is correct", "#{code[3]} is correct"]
    guesser.clear_guess
    guesser.create_guess_comp(setter.feedback, secret_code.colours)
    setter.clear_feedback
    p(code)
    p(guesser.guess)
    setter.player_create_feedback
    p(setter.feedback)
  end
end

if human_player == 'guesser'
  while setter.feedback != ["#{code[0]} is correct", "#{code[1]} is correct", "#{code[2]} is correct", "#{code[3]} is correct"]
    guesser.clear_guess
    guesser.create_guess
    setter.clear_feedback
    p(guesser.guess)
    setter.create_feedback(guesser.guess, secret_code.code)
    p(setter.feedback)
  end
end

