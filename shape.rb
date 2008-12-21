
class Shape
  include Comparable

  ORDER_TABLE = %w[
                 Square
                 Circle
                ]

  def draw
    raise 'not implemented!'
  end

  def <=>(other)
    ORDER_TABLE.index(self.class.to_s) <=> ORDER_TABLE.index(other.class.to_s)
  end
end

class Circle < Shape
  attr_accessor :center_point
  attr_accessor :radius

  def initialize(center_point, radius)
    @center_ppoint = center_point
    @radius = radius
  end

  def draw
    puts 'draw Circle'
  end
end

class Square < Shape
  attr_accessor :side_length
  attr_accessor :top_left_point

  def initialize(side_length, top_left_point)
    @side_length = side_length
    @top_left_point = top_left_point
  end

  def draw
    puts 'draw Square'
  end
end

def draw_all_shapes(shape_list)
  shape_list.sort.each{|shape|
    shape.draw
  }
end


def main
  shape_list = []
  shape_list << Circle.new(1,1)
  shape_list << Square.new(1,1)
  shape_list << Circle.new(1,1)
  shape_list << Square.new(1,1)
  shape_list << Circle.new(1,1)
  shape_list << Square.new(1,1)
  shape_list << Circle.new(1,1)
  shape_list << Square.new(1,1)
  draw_all_shapes(shape_list)
end

main
