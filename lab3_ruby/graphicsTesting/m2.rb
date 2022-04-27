require 'ruby2d'
require_relative 'level'

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
  @level = level || 0
  set( { title: 'Connect Four', background: 'white', height: 640, width: 640 } )
  @grid = Grid.new(DOTS[@level]) #This is where the array will be
  @line = []
  @tiles = @grid.tiles
end

draw_grid(0)

show
