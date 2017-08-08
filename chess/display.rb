require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'
require_relative 'game.rb'

class Display
  attr_reader :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render

    # @board.grid.each_with_index do |row, indx|
    #   puts "0 1 2 3 4 5 6 7 " if indx==0
    #   row.each do |tile|
    #
    #   end
    # end

      # @cursor.get_input
    # system("clear")
    while true
      system("clear")
      background_color
      @cursor.get_input
    end
    puts ""
  end

  def background_color
    @board.grid.map.with_index do |row, idx|
      puts "\n"
      render_row(row, idx)

    end
  end

  def render_row(row, idx)
    row.map.with_index do |piece, j|
      if check_cursor?(idx,j)
        print piece.value.colorize(background: :red)
      else
      # bc = check_cursor
        bg = (idx + j).even? ? :green : :yellow
        print piece.value.colorize(background: bg)
      end
    end
  end

  def check_cursor?(i, j)
    @cursor.cursor_pos == [i, j]
    #   color = :red
    #   return true
    # end
    # elsif (idx + j).even?
    #   color = :green : :yellow
    # end
    # {background: color}
  end
end
