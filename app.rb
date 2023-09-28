require 'json'
require_relative 'classes/game'
require_relative 'classes/author'

class App
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  # methods for game :
  def ask_multiplayer_for_game
    print 'Is the game multiplayer [Y/N] : '
    loop do
      user_input = gets.chomp.downcase
      case user_input
      when 'y'
        return true
      when 'n'
        return false
      else
        print "Invalid input. Please enter 'Y' or 'N': "
      end
    end
  end

  def ask_author
    puts 'Add an anuthor!'
    print "Write the author's first name : "
    first_name = gets.chomp
    print "Write the author's last name : "
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
  end

  def add_game
    puts 'Add a Game!'
    print 'Enter the publish date of the Game [yyyy/mm/dd] : '
    pb_date = gets.chomp
    multi = ask_multiplayer_for_game
    print 'Last time which the game was played at [yyyy/mm/dd] : '
    last = gets.chomp
    game = Game.new(pb_date, multi, last)
    ask_author
    @games << game
    puts 'Game added successfully!'
  end

  def list_all_games
    if @games.empty?
      puts 'No game added yet'
    else
      @games.each_with_index do |game, idx|
        print "Game #{idx + 1} -"
        print "  Publish Date: #{game.publish_date},"
        print "  Multiplayer: #{game.multiplayer},"
        print "  Last Played at: #{game.last_played_at}\n"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No author added yet'
    else
      @authors.each_with_index do |author, idx|
        puts "Author #{idx + 1} - FullName : #{author.first_name} #{author.last_name}"
      end
    end
  end

  # methods for perserving data

  def save_data
    save_games
    save_authors
  end

  def load_data
    load_games
    load_authors
  end

  def save_games
    File.open('data/game.json', 'w') do |file|
      game_data = @games.map do |game|
        {
          'publish_date' => game.publish_date,
          'multiplayer' => game.multiplayer,
          'last_played' => game.last_played_at
        }
      end
      file.write(JSON.generate(game_data))
    end
  end

  def load_games
    if File.exist?('data/game.json')
      game_data = JSON.parse(File.read('data/game.json'))
      @games = game_data.map { |game| Game.new(game['publish_date'], game['multiplayer'], game['last_played']) }
    else
      []
    end
  end

  def save_authors
    File.open('data/author.json', 'w') do |file|
      author_data = @authors.map do |author|
        {
          'first_name' => author.first_name,
          'last_name' => author.last_name
        }
      end
      file.write(JSON.generate(author_data))
    end
  end

  def load_authors
    if File.exist?('data/author.json')
      author_data = JSON.parse(File.read('data/author.json'))
      @authors = author_data.map { |author| Author.new(author['first_name'], author['last_name']) }
    else
      []
    end
  end
end
