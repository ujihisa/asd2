
class Shape
  def draw
    raise 'not implemented!'
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
  end
end

def draw_all_shapes(shape_list)
  shape_list,each{|shape|
    shape.draw
  }
end
