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
    printer.introduction
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


end

