# frozen_string_literal: true

# Class defining the game
class Game

end

def pick_word
  word_file = File.read('google-10000-english.txt').split
  word_array = word_file.select { |word| word.size.between?(5, 12) }
  word_array.sample.split('')
end

def create_spaces(word)
  Array.new(word.size, ' ')
end

