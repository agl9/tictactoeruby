# frozen_string_literal: true

# class to take in details from users and run the program
class Main
  require_relative 'board.rb'
  require_relative 'player.rb'
  loop do
    board = Board.new
    puts 'Enter name of player X'
    namex = gets.chomp.to_s
    playerx = Player.new(namex, 'X')
    puts 'Enter name of player O'
    nameo = gets.chomp.to_s
    playero = Player.new(nameo, 'O')
    board.display
    loop do
      playerx.move(board)
      break if playerx.won == 1

      playero.move(board)
      break if playero.won == 1
    end
    puts 'Press Y to play again. Any other key to exit'
    repeat = gets.chomp.to_s.downcase
    break if repeat != 'y'
  end
end
