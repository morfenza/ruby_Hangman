# frozen_string_literal: true

# Module to check win condition and other conditions needed
module Check
  def won?(spaces, word)
    spaces.eql?(word)
  end

  def letter?(letter, word)
    word.include?(letter)
  end
end