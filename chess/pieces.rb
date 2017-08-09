require 'singleton'
require_relative 'piecemodules.rb'

class Piece
  attr_reader :moved, :player, :value, :move_type, :deltas
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
    @move_type = :horizontal
    super
  end
end

class Knight < Piece
  include SteppingPiece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♞ " : " ♘ "
    super
    @deltas = [[-2,-1], [-2,1],[ 2,-1], [2,1], [-1,-2], [-1,2], [1,2], [1,-2]]
  end
end

class Bishop < Piece
  include SlidingPiece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♝ " : " ♗ "
    @move_type = :diagonal
    super
  end
end

class Queen < Piece
  include SlidingPiece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♛ " : " ♕ "
    @move_type = :both
    super
  end
end

class King < Piece
  include SteppingPiece
  def initialize(player, pos)
    @value = player.player_color == :black ? " ♚ " : " ♔ "
    @deltas = [[-1,-1], [-1,1], [1,-1], [1,1], [-1,0], [1,0], [0,1], [0,-1]]
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
