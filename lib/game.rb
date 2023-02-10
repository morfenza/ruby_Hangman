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

def insert_letter(letter, spaces, word)
  return unless word.include?(letter)

  spaces.map!.with_index do |space, index|
    if word[index].eql?(letter)
      letter
    else
      space
    end
  end
end
