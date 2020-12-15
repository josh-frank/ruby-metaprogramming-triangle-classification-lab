class Triangle

  attr_accessor :one, :two, :three

  def initialize( first, second, third )
    @one = first
    @two = second
    @three = third
  end

  def equilateral?
    one == two && two == three
  end

  def scalene?
    one != two && two != three && one != three
  end

  def isosceles?
    one == two || two == three || one == three
  end

  def zero_side?
    one == 0 || two == 0 || three == 0
  end

  def negative_side?
    one < 0 || two < 0 || three < 0
  end

  def violates_triangle_inequality?
    three >= one + two || two >= one + three || one >= two + three    
  end

  def kind
    if ( zero_side? || negative_side? || violates_triangle_inequality? )
      begin
        raise TriangleError
      end
    end
    return :equilateral if equilateral?
    return :scalene if scalene?
    return :isosceles if isosceles?
  end

  class TriangleError < StandardError
    def message
      "Not a valid triangle!"
    end
  end

end
