# frozen_string_literal: true

# class to create players and record their moves
class Player
  require_relative 'board.rb'
  @@moves = 0
  attr_reader :won
  def initialize(name, sign, won = 0)
    @name = name
    @sign = sign
    @won = won
  end

  def move(board)
    loop do
      puts "#{@name} - Please enter row A,B or C"
      x = gets.chomp.to_s.downcase
      while x.match(/[a-c]/).nil?
        puts "#{@name} - Only enter row A,B or C"
        x = gets.chomp.to_s.downcase
      end
      puts "#{@name} - Please enter column 1,2 or 3"
      y = gets.chomp.to_i - 1
      until y.zero? || y == 1 || y == 2
        puts "#{@name} - Only enter column 1,2 or 3"
        y = gets.chomp.to_i - 1
      end
      case x
      when 'a'
        if board.line1[y] == ' '
          board.line1[y] = @sign
        else
          puts 'That block is taken. Please input again'
          next
        end
      when 'b'
        if board.line2[y] == ' '
          board.line2[y] = @sign
        else
          puts 'That block is taken. Please input again'
          next
        end
      when 'c'
        if board.line3[y] == ' '
          board.line3[y] = @sign
        else
          puts 'That block is taken. Please input again'
          next
        end
      end
      break
    end
    board.display
    @@moves += 1
    won?(board) if @@moves > 4

    return unless @@moves >= 9 && @won.zero?

    puts "it's a tie"
    board.clear_board
    @won = 1
  end

  private

  def won?(board)
    if board.line1[0] == @sign && board.line1[1] == @sign && board.line1[2] == @sign ||
       board.line2[0] == @sign && board.line2[1] == @sign && board.line2[2] == @sign ||
       board.line3[0] == @sign && board.line3[1] == @sign && board.line3[2] == @sign ||
       board.line1[0] == @sign && board.line2[0] == @sign && board.line3[0] == @sign ||
       board.line1[1] == @sign && board.line2[1] == @sign && board.line3[1] == @sign ||
       board.line1[2] == @sign && board.line2[2] == @sign && board.line3[2] == @sign ||
       board.line1[0] == @sign && board.line2[1] == @sign && board.line3[2] == @sign ||
       board.line1[2] == @sign && board.line2[1] == @sign && board.line3[0] == @sign
      puts "#{@name} is the winner"
      @won = 1
      board.clear_board
    end
  end
end
