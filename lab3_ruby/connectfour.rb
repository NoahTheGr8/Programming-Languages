# Ruby Assignment Code Skeleton
# Nigel Ward, University of Texas at El Paso
# April 2015, April 2019
# borrowing liberally from Gregory Brown's tic-tac-toe game

#------------------------------------------------------------------
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
  end

  def update(row, col, player)
    @board[row][col] = player
  end

  def print
    puts @board.map {|row| row.map { |e| e || " "}.join("|")}.join("\n") # <--------- Original
    #puts @board.map {|row| row.reverse_each.map { |e| e || " "}.join("|")}.join("\n").reverse #my modification
    puts "\n"
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
    i = 0
    #board.print
    #puts "#{board.class}"
    while @board[i][col] != nil
      @board[i][col] = @board[i+1][col]
      i+=1
    end
  end

end # Board
#------------------------------------------------------------------

def robotMove(player, board)   # stub
  return 0
  #return rand(7)
end


#------------------------------------------------------------------
def testResult(testID, move, targets, intent)
  if targets.member?(move)
    puts("testResult: passed test #{testID}")
    return true
  else
    puts("testResult: failed test #{testID}: \n moved to #{move}, which wasn't one of #{targets}; \n failed: #{intent}")
    return false
  end
end






#------------------------------------------------------------------
# test some robot-player behaviors
testboard1 = Board.new
testboard1.addDisc(:R,4)
testboard1.addDisc(:O,4)
testboard1.addDisc(:R,5)
testboard1.addDisc(:O,5)
testboard1.addDisc(:R,6)
testboard1.addDisc(:O,6)
testResult(:hwin, robotMove(:R, testboard1),[3], 'robot should take horizontal win')
testboard1.print

testboard1.popOut(4) #removes the bottom most counter on the 4th column (cols start at 0)
testboard1.print




# testboard2 = Board.new
# testboard2.addDiscs(:R, [3, 1, 3, 2, 3, 4]);
# testResult(:vwin, robotMove(:R, testboard2), [3], 'robot should take vertical win')
# testboard2.print


testboard3 = Board.new
testboard3.addDiscs(:O, [3, 1, 4, 5, 2, 1, 6, 0, 3, 4, 5, 3, 2, 2, 6 ]);
testResult(:dwin, robotMove(:R, testboard3), [3], 'robot should take diagonal win')
testboard3.print

testboard3.popOut(2)
testboard3.print


# testboard4 = Board.new
# testboard4.addDiscs(:O, [1,1,2,2,3])
# testResult(:preventHoriz, robotMove(:R, testboard4), [4], 'robot should avoid giving win')
# testboard4.print


testboard5 = Board.new
puts "\n\n\n###################### Interactive Connect Four ######################"
puts "You are player O"
testboard5.print
while true
  print "** Enter column to enter disc (1-7): "
  col = gets.chomp #this is the desired column that the user wants to enter disc
  testboard5.addDisc(:O,col.to_i - 1)
  puts ">> You added O disk at col #{col} <<"
  testboard5.print

  if testboard5.hasWon?(:O)
    puts "======= You win ======="
    break
  end

  robot_move = rand(0..6)
  testboard5.addDisc(:R,robot_move)
  puts ">> Robot added R disk at col #{robot_move} <<"
  testboard5.print

  if testboard5.hasWon?(:R)
    puts "======= You lose ======="
    break
  end

end
