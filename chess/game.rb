require_relative "board.rb"
require_relative "player.rb"

class Game
  attr_accessor :board
  attr_reader :player1, :player2
  def initialize(player1 = "Ryan", player2 = "David")
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @board = Board.new()
    fill_up_board
  end

  def fill_up_board
    put_pieces(@player1)
    put_pieces(@player2)
    # init_null_pieces
  end

  def put_pieces(player)
    if player == @player1
      i = 7
      j = 6
    else
      i = 0
      j = 1
    end
    piece_init(player, i, j)
  end

  def piece_init(player, i, j)
    @board[[i, 0]] = Rook.new(player, [i,0])
    @board[[i, 1]] = Knight.new(player, [i,1])
    @board[[i, 2]] = Bishop.new(player, [i,2])
    @board[[i, 3]] = Queen.new(player, [i,3])
    @board[[i, 4]] = King.new(player, [i,4])
    @board[[i, 5]] = Bishop.new(player, [i,5])
    @board[[i, 6]] = Knight.new(player, [i,6])
    @board[[i, 7]] = Rook.new(player, [i,7])

    (8).times do |indx|
      @board[[j, indx]] = Pawn.new(player, [j,indx])
    end
  end

  def init_null_pieces
    (2..5).each do |x|
      (0..7).each do |y|
        @board[[x,y]] = NullPiece.new
      end
    end
  end

  def put_nulls
  end
end
