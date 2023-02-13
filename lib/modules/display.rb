# frozen_string_literal: true

# Module to display messages and game content
module Display
  def display_start_game
    display_logo
    display_main_menu
    display_menu_options
  end

  def display_spaces(spaces)
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
end
