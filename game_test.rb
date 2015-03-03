gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './game'

class GameTest < Minitest::Test

  def test_it_works
    assert Game
  end

  def test_secret_code_returns_four_colors
    example = Game.new
    assert_equal 4, example.secret_code.count
  end

end


