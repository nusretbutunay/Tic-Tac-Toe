# !/usr/bin/env ruby
require "./lib/app"


puts 
puts $player2.player_info

game = Game.new()

def get_input(player)
  puts "#{player}'s Turn"
  user_input = gets.chomp.to_i
  loop do
    return user_input if (user_input.is_a? Integer) && (user_input.positive? && user_input < 10)

    puts 'Invalid Input. Enter A Number between 1 - 9'
    user_input = gets.chomp.to_i
  end
end


def play
  puts '-------------------------'
  puts '|   1   |   2   |   3   |'
  puts '-------------------------'
  puts '|   4   |   5   |   6   |'
  puts '-------------------------'
  puts '|   7   |   8   |   9   |'
  puts '-------------------------'

  puts 'Gameplay, Player 1 should choose his/her tag, player 2 gets assigned a tag automatically.
  To place your tag on the board, choose a number
  between 1-9 as displayed in the board above. The first player who gets three(3) tags in vertically,
  horizontally or diagonally lined up wins!'

  puts 'Enter Numbers Between 1 - 9'
  board = Board.new()
  current_player_input = get_input(game.make_move())
  count = 1
  while count < 9
    board.display_board
    until board.valid_position?(current_player_input)
      current_player_input = count.odd? ? get_input(player1_tag) : get_input(player2_tag)
    end
    game.make_move(current_player_input)
      
    # Update the Board
    # Check if Player has won
    count += 1
  end
  current_player_input
end

play


