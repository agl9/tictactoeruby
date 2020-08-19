# frozen_string_literal: true

# class to create and display board
class Board
  attr_accessor :line1, :line2, :line3

  def initialize
    @line1 = [' ', ' ', ' ']
    @line2 = [' ', ' ', ' ']
    @line3 = [' ', ' ', ' ']
  end

  def clear_board
    @line1 = [' ', ' ', ' ']
    @line2 = [' ', ' ', ' ']
    @line3 = [' ', ' ', ' ']
  end

  def display
    puts "        1     2     3
          |     |
    A   #{@line1[0]} |  #{@line1[1]}  |  #{@line1[2]}
     _____|_____|_____
          |     |
    B   #{@line2[0]} |  #{@line2[1]}  |  #{@line2[2]}
     _____|_____|_____
          |     |
    C   #{@line3[0]} |  #{@line3[1]}  |  #{@line3[2]}
          |     |     "
  end
end
