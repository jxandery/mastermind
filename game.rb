require './printer'

class Game
  attr_reader :guess, :turns, :secret_code, :printer, :command

  def initialize(printer = Printer.new)
    @guess = 'rrgb'
    @turns = 0
    @secret_code = generate_secret_code
    @printer = printer
    @command = ""
  end

  def generate_secret_code
    colors = ['r', 'b', 'g', 'y']
    @secret_code = colors.map do |color|
      colors.sample
    end.join
  end

  def play
    printer.game_intro
    until win? || exit?
      printer.turn_indicator(turns)
      printer.guess_request
      @command = gets.strip
      @guess = command.downcase.chars
      process_game_turn
    end
  end

  def process_game_turn
    case
    when exit?
      printer.game_exit
    when win?
      printer.game_win
    when too_short?
      printer.too_short
    when too_long?
      printer.too_long
    when invalid_colors_guessed?
      printer.invalid_colors_guessed
    when cheat?
      printer.cheat
    when still_guessing?
      printer.feedback
      add_turn
    end
  end

  def add_turn
    @turns +=1
  end

  def exit?
    command == "q" || command == "quit"
  end

  def game_win?
    guess.join == secret_code
  end

  def too_short?
    guess.length < secret_code.length
  end

  def too_long?
    guess.length < secret_code.length
  end

  def still_guessing?
    guess.length == secret_code.length &&
    game_win == false &&
    invalid_color_guessed == false
  end

  def cheat?
    command == "c" || command == "cheat"
  end

  def invalid_color_guessed?
    colors = guess.map do |element|
      if element == "r" ||
         element == "g" ||
         element == "y" ||
         element == "b"
        true
      else
        false
      end
    end
    colors.include?(false)
  end
end
