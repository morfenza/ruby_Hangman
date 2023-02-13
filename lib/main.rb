# frozen_string_literal: true

require_relative 'game'

# Here we'll organize the game

def game_loop
  game = Game.new

  keep_going = true
  while keep_going
    game.display_start_game
    game.new_game
    game.play_again
    keep_going = game.again?
    game.clear_console
  end
end

game_loop
