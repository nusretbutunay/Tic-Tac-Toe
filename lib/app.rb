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
    board_string = ''
    @board.each_with_index do |val, i|
      board_string << "#{val} "
      board_string << "\n" if i == 2 || i == 5 || i == 8
    end
    board_string
  end

  def valid_position?(position)
    @board[position - 1].is_a? Integer
  end

  def update_board(position, player)
    @board[position - 1] = player.player_tag
  end

  def reset_board
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
