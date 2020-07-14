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
