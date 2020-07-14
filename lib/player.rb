class Player
  attr_reader :player_tag, :player_number
  def initialize(player_tag, player_number)
    @player_tag = player_tag
    @player_number = player_number
  end

  def player_info
    "Player #{@player_number} gets #{@player_tag}"
  end
end
