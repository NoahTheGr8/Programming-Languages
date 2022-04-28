require 'ruby2d'
require_relative 'level'
require_relative 'board'

def draw_grid(color)
  set( { title: 'Connect Four', background: color , height: 800, width: 800 } )
  @grid = Grid.new(DOTS[0]) #This is where the array will be
  @line = []
  @tiles = @grid.tiles
end


# test some robot-player behaviors
# testboard1 = Board.new
# testboard1.addDisc(:R,4)
# testboard1.addDisc(:O,4)
# testboard1.addDisc(:R,5)
# testboard1.addDisc(:O,5)
# testboard1.addDisc(:R,6)
# testboard1.addDisc(:O,6)
#testResult(:hwin, robotMove(:R, testboard1),[3], 'robot should take horizontal win')
#testboard1.print
#testboard1.popOut(4) #removes the bottom most counter on the 4th column (cols start at 0)
#testboard1.print

# draw_grid()
# col = 0
# puts DOTS[0][:dots][:yellow]
# DOTS[0][:dots][:yellow] << 0 * 5 + col
# puts DOTS[0][:dots][:yellow]
# draw_grid()
# show

#---------------------------------------------------------------------------


testboard5 = Board.new

puts "\n\n\n###################### Interactive Connect Four ######################"
puts "You are player O, and Yellow on GUI"
testboard5.print
color = 'black'
draw_grid(color)
set( { :title => "Connect Four" } )
update do

  #--------------------------- GET USER INPUT AND GET ITS CORRECT POSITION ON THE BOARD
  print "** Enter column to enter disc (1-7): "
  col = gets.chomp.to_i - 1 #this is the desired column that the user wants to enter disc
  t = Time.now
  ffr = testboard5.addDisc(:O,col) #ffw means first free row
  next_usr_pos = ffr * 7 + col #the next spo
  DOTS[0][:dots][:yellow] << next_usr_pos #appending the next disc
  puts ">> You added O disk at col #{col} <<"
  testboard5.print #prints to the console just in case

  #Checks if the user has won from his/her move
  if testboard5.hasWon?(:O)
    puts "======= You win ======="
    color = 'green'
  end

  if !testboard5.hasWon?(:O)
    #--------------------------- GET ROBOT INPUT AND GET ITS CORRECT POSITION ON THE BOARD
    robot_col = rand(0..6)
    ffr = testboard5.addDisc(:R,robot_col)
    next_robot_pos = ffr * 7 + robot_col #the next position on the board
    DOTS[0][:dots][:red] << next_robot_pos #setting the robots disk with its color and board position
    puts ">> Robot added R disk at col #{robot_col} <<"
    testboard5.print #prints to the console just in case

    #Checks if the robot has won from its move
    if testboard5.hasWon?(:R)
      puts "======= You lose ======="
      color = 'red'
    end
  end #outter if - if the user hasnt won then the robot goes

  draw_grid(color)
  if testboard5.hasWon?(:O) || testboard5.hasWon?(:R)
    close
  end
end #udpate do
show
sleep 5
