# frozen_string_literal: true

# Module to check win condition and other conditions needed
module Check
  def won?
    guess.eql?(word)
  end
end