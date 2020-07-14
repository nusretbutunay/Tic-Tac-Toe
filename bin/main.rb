#!/usr/bin/env ruby
puts 'Hello world!'

def get_input(player)
  puts "#{player}'s Turn"
  user_input = gets.chomp.to_i
  loop do
    return user_input if (user_input.is_a? Integer) && (user_input.positive? && user_input < 10)

    puts 'Invalid Input. Enter A Number between 1 - 9'
    user_input = gets.chomp.to_i
  end
end

def game
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

  puts 'Player 1, Choose your Alphabet X OR O'
  player1_tag, player2_tag = player_tag_selection

  puts "Player 1: #{player1_tag}                   Player 2: #{player2_tag}"

  puts 'Enter Numbers Between 1 - 9'

  current_player_input
  count = 0
  while count < 9
    # Display Game Board
    current_player_input = count.even? ? get_input(player1_tag) : get_input(player2_tag)
    # Check if position is valid
    # Update the Board
    # Check if Player has won
    count += 1
  end
  current_player_input
end

game
