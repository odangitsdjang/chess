require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  attr_reader :board, :selector
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @selector = []
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
    system("clear")
    p @selector
    background_color
    if output = @cursor.get_input # when not nil we do a thing
      if @selector.empty? || @selector.length == 2
        @selector = []
        @selector << output
      elsif @selector.length == 1
        @selector << output
      end
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
        print piece.value.colorize(background: :light_red)
      else
        if @selector.length == 1
          ii, jj = @selector[0]
        end
        if [ii, jj] == [idx, j]
          bg = :light_green
        else
          bg = (idx + j).even? ? :green : :light_yellow
        end
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
