# frozen_string_literal: true

require_relative 'stickman'

# Module to display messages and game content
module Display
  include HangedPerson

  def display_start_game
    display_logo
    display_main_menu
    display_menu_options
  end

  def display_round(tries, spaces, guesses)
    display_hang(tries)
    display_letter(spaces)
    puts
    display_letter(guesses)
  end

  def display_letter(spaces)
    spaces.each do |space|
      if space == ' '
        print '_ '
      else
        print "#{space.upcase} "
      end
    end
    puts
  end

  def display_logo
    puts <<~LOGO
       _
      | |
      | |__   __ _ _ __   __ _ _ __ ___   __ _ _ __
      | '_ \\ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \
      | | | | (_| | | | | (_| | | | | | | (_| | | | |
      |_| |_|\\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|
                          __/ |
                         |___/

    LOGO
  end

  def display_main_menu
    puts <<~MENU

      # Welcome to Hangman!
        In this game you'll play against the machine, you'll have
        to guess each letter before the stickperson is hanged

        You can fail 6 times before the stickperson is hanged

        Good luck!

      # How to play
        The word will be randomly chosen by the machine, the word has between 
        5 and 12 letters

        Write the letter you want to guess, you can write a wrong letter 6 times

    MENU
  end

  def display_menu_options
    puts <<~OPTIONS

      # Options
        1 - Play the game
        2 - Load game

    OPTIONS
  end

  def display_round_options
    puts <<~OPTIONS

      # Options
        Letter  - Guess
        save    - Save game

    OPTIONS
  end

  def display_victory
    puts "\t\t You've won! Congratulations!"
  end

  def display_loss
    puts "\t\t You've Lost :( Try again!"
  end

  def play_again
    puts 'Play again? (y/n)'
  end

  def clear_console
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end
end
