# frozen_string_literal: true

require_relative 'modules/check'
require_relative 'modules/stickman'
require_relative 'modules/display'
require_relative 'modules/serialization'

# Class defining the game
class Game
  include Check
  include Display
  include HangedPerson
  include Serialization

  attr_reader :word, :spaces

  def create_game
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
    letter = check_letter(@guesses)
    return 'save' if letter == 'save'

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
    return unless player_guess == 'save'

    save_game
    'save'
  end

  def play_match
    until @tries.zero?
      return if play_round == 'save'
      return display_victory if won?(@spaces, @word)

      clear_console
    end
    display_loss(@word)
  end

  def new_game
    loop do
      puts 'Choose an option'
      option = check_option

      create_game if option == 1

      next if option == 2 && (load_game == false)

      clear_console
      play_match
      return
    end
  end
end
