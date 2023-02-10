# frozen_string_literal: true

require_relative 'modules/check'
require_relative 'modules/stickman'

# Class defining the game
class Game
  include Check
  include HangedPerson

  attr_reader :word, :spaces

  def initialize
    @word = pick_word
    @spaces = create_spaces(@word)
    @guesses = []
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

  def play_match
    tries = 6
    until tries.zero?
      p @guesses
      p @spaces
      display_hang(tries)
      p tries
      letter = gets.chomp
      if letter?(letter, @word)
        insert_letter(letter)
        won?(@spaces, @word)
      else
        @guesses << letter unless @guesses.include?(letter)
        tries -= 1
      end
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    end
    display_hang(tries)
  end
end

g = Game.new
g.play_match