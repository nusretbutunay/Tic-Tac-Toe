class Game
  def initialize
    $player1 = Player.new("X", 1)
    $player2 = Player.new("O", 2)
    @player1 = nil
    @player2 = nil
  end
  def make_move(current_player)
    Board.update_board(current_player.player_tag)
  end

  def set_player(player1,player2)
    @player1 = player1
    @player2 = player2
  end
end

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

class Board
  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def display_board
  end

  def valid_position?(position)
      
  end

  def self.update_board(position)
    @board[position] = player_tag
  end

  def reset_board
  end
end