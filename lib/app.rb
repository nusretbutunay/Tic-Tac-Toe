#  Initialize players with tags
#  Display Board
#  Player1 should choose spot on board
#  Update Board with input
#  Check for win or tie
#  Display Board
#  Player2 should choose spot on board

# PLAYER
#  Initialize players with tags

class Game
  attr_reader :player1, :player2
  def initialize
    @player1 = Player.new('X', 1)
    @player2 = Player.new('O', 2)
    @board = Board.new
  end

  def make_move(current_player)
    Board.update_board(current_player.player_tag)
  end

  def check_win?; end

  def check_draw?
    true unless check_win? || @board.board.none?(Integer)
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
  attr_reader :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    @board.each_with_index do |val, i|
      print "#{val} "
      puts '' if i == 2 || i == 5 || i == 8
    end
  end

  def valid_position?(position)
    @board[position - 1].is_a? Integer
  end

  def update_board(position, player)
    @board[position - 1] = player.player_tag
  end

  def reset_board; end
end
