require 'ruby2d'
require_relative 'level'
require_relative 'board'

# @down = false
# level = Level.new
# return unless level.draw_grid
#
# on :mouse do |event|
#   case event.type
#   when :move
#     if @down
#       level.mouse_down(event)
#     end
#   when :up
#     @down = false
#     level.remove_line(event)
#   when :down
#     @down = true
#     level.mouse_down(event)
#   end
#   level.erase_line(event) if event.button == :right
# end
#
# update do
#   level.win
# end
#
# level.show

def draw_grid(level=nil)
  set( { title: 'Connect Four', background: 'white', height: 800, width: 800 } )
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
puts "You are player O"
#testboard5.print
draw_grid()
while true
  print "** Enter column to enter disc (1-7): "
  col = gets.chomp.to_i - 1 #this is the desired column that the user wants to enter disc


  #TODO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ffr = testboard5.addDisc(:O,col) #ffw means first free row
  next_usr_pos = ffr * 7 + col #the next spo
  puts ">>>>>>>>>>> #{ffr} #{next_usr_pos}"
  DOTS[0][:dots][:yellow] << next_usr_pos #appending the next disc
  puts ">> You added O disk at col #{col} <<"
  testboard5.print

  if testboard5.hasWon?(:O)
    puts "======= You win ======="
    break
  end

  robot_col = rand(0..6)
  ffr = testboard5.addDisc(:R,robot_col)
  next_robot_pos = ffr * 7 + robot_col #the next spo
  #TODO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  DOTS[0][:dots][:red] << next_robot_pos #appending the next disc


  puts ">> Robot added R disk at col #{robot_col} <<"
  testboard5.print

  if testboard5.hasWon?(:R)
    puts "======= You lose ======="
    break
  end
  draw_grid()
  show
end #while loop
