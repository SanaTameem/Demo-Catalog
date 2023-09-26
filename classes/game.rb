require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :publish_date, :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    current = Time.now.year - Date.parse(@last_played_at).year
    super && current > 2
  end
end
