#!/usr/bin/env ruby
require './lib/app'

def get_input(player)
  puts "Player #{player.player_number}'s Turn (#{player.player_tag})"
  user_input = gets.chomp.to_i
  loop do
    return user_input if (user_input.is_a? Integer) && (user_input.positive? && user_input < 10)

    puts 'Invalid Input. Enter A Number between 1 - 9'
    user_input = gets.chomp.to_i
  end
end

def play
  puts 'Gameplay, Player 1 should choose his/her tag, player 2 gets assigned a tag automatically.
    To place your tag on the board, choose a number
    between 1-9 as displayed in the board above. The first player who gets three(3) tags in vertically,
    horizontally or diagonally lined up wins!'
  puts '-------------------------'
  puts '|   1   |   2   |   3   |'
  puts '-------------------------'
  puts '|   4   |   5   |   6   |'
  puts '-------------------------'
  puts '|   7   |   8   |   9   |'
  puts '-------------------------'

  puts 'Enter Numbers Between 1 - 9'

  game = Game.new
  board = Board.new
  current_player = nil
  count = 1
  current_player_input = get_input(game.player1)
  until game.check_win?(board.board) || game.check_draw?(board.board)

    current_player_input = count.odd? ? get_input(game.player1) : get_input(game.player2) until board.valid_position?(current_player_input)
    current_player = count.odd? ? game.player1 : game.player2
    board.update_board(current_player_input, current_player)
    puts board.display_board
    count += 1
  end

  if game.check_win?(board.board)
    puts "Player #{current_player.player_number} (#{current_player.player_tag}) WON!!!"

    puts 'Do you want a re-match? Y for YES'
    replay = gets.chomp
    board.reset_board
    play if replay == 'y'
  elsif game.check_draw?(board.board)
    puts 'DRAW GAME. TRY AGAIN?!! Y for YES'
    replay = gets.chomp
    board.reset_board
    play if replay == 'y'
  end
end

play
