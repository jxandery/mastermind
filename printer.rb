class Printer

  def introduction
    "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    program_instructions
  end

  def program_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (c)heat to see the secret code.  Use (q)uit at any time to end the game.\nWhat's your guess?"
  end

  def command_request
    "Enter your command"
  end

  def game_intro
    puts "Game started"
    puts "What's your guess?"
  end

  def turn_indicator(turns)
    puts "This is turn #{turns}."
  end

  def guess_request
    print "Enter your guess"
  end

  def feedback
    "'#{@guess}' has #{@correct_elements} of the correct elements with #{@correct_position} in the correct positions. \nYou've taken #{number_of_guesses}."
  end

  def invalid_colors_guessed
    puts "Your guess is not a valid color. You can only guess from (r)ed, (g)reen, (b)lue, and (y)ellow. Try again"
  end

  def too_short
    puts "You didn't guess enough colors. You have to guess 4 colors. Try again"
  end

  def too_long
    puts "You guessed too many colors. You can only guess 4 colors. Try again"
  end

  def not_a_valid_command
    puts "That's not a valid command"
    program_instructions
  end

  def cheat
    puts "The secret code is #{@secret_code}."
  end

  def game_win
    puts "Congratulations! You guessed the sequence '#{@guess}' in #{@number_of_guesses} over #{@time}."
    continue_play
  end

  def continue_play
    "Do you want to (p)lay again or (q)uit?"
  end

  def out_of_guesses
    "Sorry, you've used up all your guesses."
  end

  def game_quit
    puts "Exiting the game."
    program_instructions
  end

  def ending
    "GoodBye!"
  end

end
