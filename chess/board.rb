require_relative "pieces.rb"
require 'colorize'

class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) { Array.new(8) }
  end

  def move_piece(start_pos, end_pos)
    # begin
    #   raise "Empty start position ?????????" if valid_start_move?(start_pos)
    #     raise "End pos is filled"
    #   end
    if valid_start_move?(start_pos) && valid_end_move?(start_pos, end_pos)
      self[start_pos].pos = end_pos
      self[end_pos] = self[start_pos] # keep track of moved? for pawns, rook, king
      self[start_pos] = NullPiece.instance
    end
  end

  def valid_start_move?(pos)
    self[pos].class != NullPiece
  end

  # not finished
  def valid_end_move?(start_pos, end_pos)
    poss_moves = self[start_pos].moves
    return false unless poss_moves.include?(end_pos)
    # also need to check collision for other pieces
    if self[end_pos].class == NullPiece # need extra check for pawns
      return true
    else
      return false if self[end_pos].player == self[start_pos].player #unless castling
    end
    # not_blocked?(start_pos, end_pos)
    true
  end


#not working currently
  def not_blocked?(start_pos, end_pos)
    if start_pos[0] == end_pos[0] #vertical
      #true if all null piece
      return (start_pos[1]+1...end_pos[1]).all? do |j|
        self[[start_pos[0],j]].class == NullPiece
      end
    end
    if start_pos[1] == end_pos[1]
      return (start_pos[0]+1...end_pos[0]).all? do |i|
        self[[i, start_pos[1]]].class == NullPiece
      end
    end
    false
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
