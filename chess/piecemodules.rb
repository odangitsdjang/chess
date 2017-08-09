require_relative 'pieces.rb'

module SlidingPiece

  HORIZONTAL = [[0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7],
                [0,-1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7],
                [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0],
                [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0]]

  DIAGONAL =  [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],
               [-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7],
               [-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-6,6],[-7,7],
               [1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[6,-6],[7,-7]]

  def moves #return array of possible move positions
    return moveset(HORIZONTAL) if @move_type == :horizontal
    return moveset(DIAGONAL) if @move_type == :diagonal
    return moveset(HORIZONTAL + DIAGONAL) if @move_type == :both
  end

  def moveset(direction)
    x,y = @pos
    possible = direction.map {|arr_pos| [x+arr_pos[0], y+arr_pos[1]]}
    possible.select {|arr_pos| arr_pos[0].between?(0,7) &&
                               arr_pos[1].between?(0,7) }
  end

end


module SteppingPiece

  def moveset(pos)
    x, y = pos
    possible = @deltas.map {|arr_pos| [x+arr_pos[0], y+arr_pos[1]] }
    possible.select {|arr_pos| arr_pos[0].between?(0,7) &&
                               arr_pos[1].between?(0,7) }
  end


  def moves
    moveset(@pos)
  end
end
