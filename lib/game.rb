# frozen_string_literal: true

require_relative 'modules/check'
require_relative 'modules/stickman'
require_relative 'modules/display'

# Class defining the game
class Game
  include Check
  include Display
  include HangedPerson

  attr_reader :word, :spaces

  def initialize
    @word = pick_word
    @spaces = create_spaces(@word)
    @guesses = []
    @tries = 6
  end

  def pick_word
    word_file = File.read('google-10000-english.txt').split
    word_array = word_file.select { |word| word.size.between?(5, 12) }
    word_array.sample.split('')
  end

  def create_spaces(word)
    Array.new(word.size, ' ')
  end

  def insert_letter(letter)
    @spaces.map!.with_index do |space, index|
      if @word[index].eql?(letter)
        letter
      else
        space
      end
    end
  end

  def player_guess
    letter = gets.chomp
    if letter?(letter, @word)
      insert_letter(letter)
    else
      @guesses << letter unless @guesses.include?(letter)
      @tries -= 1
    end
  end

  def play_round
    display_round(@tries, @spaces, @guesses)
    display_round_options
    player_guess
  end

  def play_match
    until @tries.zero?
      play_round
      clear_console
      return display_victory if won?(@spaces, @word)
    end
    display_loss
  end
end

g = Game.new
g.play_match