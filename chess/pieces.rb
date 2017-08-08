require 'singleton'
require_relative 'piecemodules.rb'

class Piece
  attr_reader :moved, :player, :value, :move_type
  attr_accessor :pos
  def initialize(player, pos)
    @player = player
    @moved = false
    @pos = pos
  end

  def moves
  end

end



class Rook < Piece
  include SlidingPiece

  def initialize(player, pos)
    @value = player.player_color == :black ? " ♜ " : " ♖ "
    @move_type = horizontal
    super
  end
end

class Knight < Piece
  DELTAS = [[-2,-1], [-2,1],[ 2,-1], [2,1], [-1,-2], [-1,2], [1,2], [1,-2]]

  def initialize(player, pos)
    @value = player.player_color == :black ? " ♞ " : " ♘ "
    super
  end

  def moves
    #8 possible moves && check if position is on the board
    moveset(@pos)
    #check if occupied

      #move if empty
      #check if own color piece is there
        #move if enemy piece

  end

  def moveset(pos)
    x, y = pos
    possible = DELTAS.map {|arr_pos| [x+arr_pos[0], y+arr_pos[1]] }
    possible.select {|arr_pos| arr_pos[0].between?(0,7) &&
                      arr_pos[1].between?(0,7) }
  end
end

class Bishop < Piece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♝ " : " ♗ "
    super
  end
end

class Queen < Piece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♛ " : " ♕ "
    super
  end
end

class King < Piece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♚ " : " ♔ "
    super
  end
end

class Pawn < Piece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♟ " : " ♙ "
    super
  end

  def possible_moves(start_pos)
    x, y = start_pos
    if self.player == player1
      moveset = [[x-1,y]] #[x-1, y-1], [x-1, y+1], [x-2, y]]
    end
  end
end

# require "singleton"

class NullPiece < Piece
  include Singleton
  def initialize
    @value = "   "
  end


end
