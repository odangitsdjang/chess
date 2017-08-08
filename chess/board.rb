require_relative "pieces.rb"
require 'colorize'

class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) { Array.new(8) }
  end

  def move_piece(start_pos, end_pos)
    begin
      raise "Empty start position ?????????" if valid_start_move?(start_pos)
        raise "End pos is filled"
      end
  end

  def valid_start_move?(pos)
    self[pos].class != NullPiece
  end

  # not finished
  def valid_end_move?(start_pos, end_pos)
    poss_moves = self[start_pos].possible_moves(start_pos)
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def in_bounds
    
  end


end
