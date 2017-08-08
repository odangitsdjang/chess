require 'singleton'

class Piece
  attr_reader :moved, :player, :pos, :value
  def initialize(player, pos)
    @player = player
    @moved = false
    @pos = pos
  end

end



class Rook < Piece
  def initialize(player, pos)
    @value = " R "
    super
  end
end

class Knight < Piece
  def initialize(player, pos)
    @value = " k "
    super
  end
end

class Bishop < Piece
  def initialize(player, pos)
    @value = " b "
    super
  end
end

class Queen < Piece
  def initialize(player, pos)
    @value = " Q "
    super
  end
end

class King < Piece
  def initialize(player, pos)
    @value = " K "
    super
  end
end

class Pawn < Piece
  def initialize(player, pos)
    @value = " p "
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
