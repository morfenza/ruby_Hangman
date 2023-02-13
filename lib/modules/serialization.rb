# frozen_string_literal: true

require 'yaml'

# module used for saving and loading the game
module Serialization
  def list_saved_games
    folder = []
    Dir.entries('save').each do |file|
      folder << file
    end
    puts
    puts "Write the name of the file or 'back' to return to the menu"
    puts folder
  end

  def save_to_yaml
    YAML.dump(
      'word' => @word,
      'spaces' => @spaces,
      'guesses' => @guesses,
      'tries' => @tries
    )
  end

  def read_from_yaml
    begin
      name = gets.chomp
      return 'back' if name == 'back'

      save = File.read("save/#{name}.yaml")
    rescue StandardError => e
      puts "#{e}\nPlease choose a valid file"
      return false
    end

    save
  end

  def save_game
    puts 'Write the name of the file'
    name = gets.chomp
    File.open("save/#{name}.yaml", 'w') do |file|
      file.write save_to_yaml
    end
  end

  def load_game
    list_saved_games

    loaded = read_from_yaml

    return false if loaded == 'back'

    data = YAML.safe_load(loaded)

    @word = data['word']
    @spaces = data['spaces']
    @guesses = data['guesses']
    @tries = data['tries']
  end
end
