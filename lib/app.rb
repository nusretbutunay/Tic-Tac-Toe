require_relative './board'
require_relative './player'
class Game
  attr_reader :player1, :player2
  def initialize
    @player1 = Player.new('X', 1)
    @player2 = Player.new('O', 2)
    @board = Board.new
  end

  def make_move(current_player); end

  def check_win?(board)
    new_array = []
    new_array.push(board[0], board[3], board[6])
    return true if new_array.all?('X') || new_array.all?('O')

    new_array = []
    new_array.push(board[1], board[4], board[7])
    return true if new_array.all?('X') || new_array.all?('O')

    new_array = []
    new_array.push(board[2], board[5], board[8])
    return true if new_array.all?('X') || new_array.all?('O')

    new_array = []
    new_array.push(board[0], board[4], board[8])
    return true if new_array.all?('X') || new_array.all?('O')

    new_array = []
    new_array.push(board[2], board[4], board[6])
    return true if new_array.all?('X') || new_array.all?('O')
    if (board[0..2].all?('X') || board[0..2].all?('O')) || (board[3..5].all?('X') || board[3..5].all?('O')) || (board[6..8].all?('X') || board[6..8].all?('O'))
      return true
    end

    false
  end

  def check_draw?(board)
    !check_win?(board) && board.none?(Integer) ? true : false
  end
end
