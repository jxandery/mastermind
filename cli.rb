require './printer'
require './game'

class CLI
  attr_reader :command, :printer, :output_stream, :input_stream

  def initialize(input_stream, output_stream)
    @command = ""
    @printer = Printer.new
    @input_stream = input_stream
    @output_stream = output_stream
  end

  def start
    print_instructions
    until finished?
      printer.command_request
      @command = get_input
      process_initial_commands
    end
    printer.ending
  end

  def get_input
    input_stream.gets.chomp
  end

  def print_instructions
    printer.introduction
  end

  def process_initial_commands
    case
    when play?
      game = Game.new(printer)
      game.play
    when instructions?
      printer.program_instructions
    else
      printer.not_a_valid_command
    end
  end

end

