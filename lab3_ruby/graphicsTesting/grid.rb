require 'ruby2d'
require_relative 'tile'

class Grid < Square
  attr_accessor :tiles, :dots
  attr_reader :grid_size_x, :grid_size_y, :x, :y, :tile_size, :margin

  def initialize(params)
    @tiles = []
    @dots = params[:dots]
    @grid_size_x = params[:grid_size_x] ||= 6
    @grid_size_y = params[:grid_size_y] ||= 7
    @x = params[:x] ||= 60
    @y = params[:y] ||= 60
    @tile_size = params[:tile_size] ||= 100
    @margin = params[:margin] ||= 2
    draw_grid
  end

  def draw_grid
    y = @y
    @grid_size_x.times do
      x = @x
      @grid_size_y.times do
        @tiles << Tile.new(
          x: x,
  	      y: y,
          size: @tile_size,
          color: 'navy'
        )
        x += @tile_size + @margin
      end
      y += @tile_size + @margin
    end
    draw_dots(@dots)
    @tiles
  end

  def tile_center_position(tile)
    x = tile.x + (tile.size / 2)
    y = tile.y + (tile.size / 2)
    [x, y]
  end

  def draw_dots(dots)
    dots.each do |key, value|
      color = key.to_s
      value.each do |position|
        instanciate_dot(@tiles[position], color)
      end
    end
  end

  #This is where the disk of interest is inserted
  def instanciate_dot(tile, color)
    points = tile_center_position(tile)
    points_x = points[0]
    points_y = points[1]
      tile.dot = Circle.new(
        x: points_x,
        y: points_y,
	      radius: 33,
        sectors: 32,
        color: color,
      )
  end

  def out_of_grid(event)
    @tiles.each do |tile|
      return false if tile.contains? event.x, event.y
      true
    end
  end
end
