# frozen_string_literal: true

# Module to display the (poor) hanged person :(
module HangedPerson
  # rubocop:disable Style/ClassVars
  @@hangedperson = {
    6 => <<~HEREDOC,
        +---+
        |   |
            |
            |
            |
            |
      =========
    HEREDOC

    5 => <<~HEREDOC,
        +---+
        |   |
        O   |
            |
            |
            |
      =========
    HEREDOC

    4 => <<~HEREDOC,
        +---+
        |   |
        O   |
        |   |
            |
            |
      =========
    HEREDOC

    3 => <<~HEREDOC,
        +---+
        |   |
        O   |
       /|   |
            |
            |
      =========
    HEREDOC

    2 => <<~HEREDOC,
        +---+
        |   |
        O   |
       /|\\  |
            |
            |
      =========
    HEREDOC

    1 => <<~HEREDOC,
        +---+
        |   |
        O   |
       /|\\  |
       /    |
            |
      =========
    HEREDOC

    0 => <<~HEREDOC
        +---+
        |   |
        O   |
       /|\\  |
       / \\  |
            |
      =========
    HEREDOC
  }.freeze
  # rubocop:enable Style/ClassVars

  def display_hang(tries)
    puts @@hangedperson[tries]
  end
end
