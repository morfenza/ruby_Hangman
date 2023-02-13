# frozen_string_literal: true

# Module to check win condition and other conditions needed
module Check
  def won?(spaces, word)
    spaces.eql?(word)
  end

  def letter?(letter, word)
    word.include?(letter)
  end

  def again?
    check = gets.chomp
    return true if check == 'y'

    false
  end

  def check_option
    loop do
      option = gets.chomp
      return option.to_i if %w[1 2].include?(option)

      puts 'Please, choose a valid option'
    end
  end

  # rubocop:disable Metrics/MethodLength
  def check_letter(guesses)
    loop do
      letter = gets.chomp.downcase
      if letter.size == 1 && letter.match?(/[a-zA-Z]/)
        if guesses.include?(letter)
          puts 'Please, write a letter that has not been written before'
          next
        end
        return letter

      elsif letter == 'save'
        return letter

      end

      puts 'Please, write a valid option'
    end
  end
  # rubocop:enable Metrics/MethodLength
end
