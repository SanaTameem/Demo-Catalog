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

  def add_game
    puts 'Add a Game!'
    print 'Enter the publish date of the Game [yyyy/mm/dd] : '
    pb_date = gets.chomp
    multi = ask_multiplayer_for_game
    print 'Last time which the game was played at [yyyy/mm/dd] : '
    last = gets.chomp
    game = Game.new(pb_date, multi, last)
    @games << game
    puts 'Game added successfully!'
  end

  def list_all_games
    if @games.empty?
      puts 'No game added'
    else
      @games.each_with_index do |game, idx|
        print "Game #{idx + 1} -"
        print "  Publish Date: #{game.publish_date},"
        print "  Multiplayer: #{game.multiplayer},"
        print "  Last Played at: #{game.last_played_at}"
      end
    end
  end

  # methods for author :
  def add_author
    puts 'Add an anuthor!'
    print "Write the author's first name : "
    first_name = gets.chomp
    print "Write the author's last name : "
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    puts 'Author added successfully!'
  end

  def list_all_authors
    @authors.each_with_index do |author, idx|
      puts "Author #{idx + 1} - FullName : #{author.first_name} #{author.last_name}"
    end
  end
end
