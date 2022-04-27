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
  set( { title: 'Connect Four', background: 'white', height: 640, width: 640 } )
  @grid = Grid.new(DOTS[0]) #This is where the array will be
  @line = []
  @tiles = @grid.tiles
end


# test some robot-player behaviors
testboard1 = Board.new
testboard1.addDisc(:R,4)
testboard1.addDisc(:O,4)
testboard1.addDisc(:R,5)
testboard1.addDisc(:O,5)
testboard1.addDisc(:R,6)
testboard1.addDisc(:O,6)
#testResult(:hwin, robotMove(:R, testboard1),[3], 'robot should take horizontal win')
#testboard1.print
#testboard1.popOut(4) #removes the bottom most counter on the 4th column (cols start at 0)
#testboard1.print

draw_grid()
col = 0
puts DOTS[0][:dots][:yellow]
DOTS[0][:dots][:yellow] << 0 * 5 + col
puts DOTS[0][:dots][:yellow]
draw_grid()

show
