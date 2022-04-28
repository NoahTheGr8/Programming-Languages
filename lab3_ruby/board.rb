class Board
  def initialize
  @board = [[nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil] ]
  end

  # process a sequence of moves, each just a column number
  def addDiscs(firstPlayer, moves)
    if firstPlayer == :R
      players = [:R, :O].cycle
    else
      players = [:O, :R].cycle
    end
    moves.each {|c| addDisc(players.next, c)}
  end

  def addDisc(player, column)
    if column >= 7 || column < 0
      puts "  addDisc(#{player},#{column}): out of bounds; move forfeit"
    end
    firstFreeRow =  @board.transpose.slice(column).rindex(nil)
    if firstFreeRow == nil
      puts "  addDisc(#{player},#{column}): column full already; move forfeit"
    end
    update(firstFreeRow, column, player)
    return firstFreeRow #Adding this line so that we can print it
  end

  def update(row, col, player)
    @board[row][col] = player
  end

  def print
    puts @board.map {|row| row.map { |e| e || " "}.join("|")}.join("\n") # <--------- Original
    #below prints the area in the classic format
    # @board.each do |value|
    #     puts value.to_s + " "
    # end
    # puts "\n"
  end

  def hasWon? (player)
    return verticalWin?(player)| horizontalWin?(player) |
           diagonalUpWin?(player)| diagonalDownWin?(player)
  end

  def verticalWin? (player)
    (0..6).any? {|c| (0..2).any? {|r| fourFromTowards?(player, r, c, 1, 0)}}
  end

  def horizontalWin? (player)
    (0..3).any? {|c| (0..5).any? {|r| fourFromTowards?(player, r, c, 0, 1)}}
  end

  def diagonalUpWin? (player)
    (0..3).any? {|c| (0..2).any? {|r| fourFromTowards?(player, r, c, 1, 1)}}
  end

  def diagonalDownWin? (player)
    (0..3).any? {|c| (3..5).any? {|r| fourFromTowards?(player, r, c, -1, 1)}}
  end

  def fourFromTowards?(player, r, c, dx, dy)
    return (0..3).all?{|step| @board[r+step*dx][c+step*dy] == player}
  end

  #------------------------------------------------------------------
  def popOut(col)

    i = 5
    #puts "IN POP OUT #{i} #{col} #{@board[i][col]}"
    #board.print
    #puts "#{board.class}"
    while @board[i][col] != nil
      @board[i][col] = @board[i-1][col]
      i-=1
    end
  end

end # Board
#------------------------------------------------------------------
