=begin
Write a program to determine whether a triangle is equilateral, 
isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of 
length > 0, and the sum of the lengths of any two sides must 
be greater than the length of the third side.

PEDAC
Understand the problem:
- Explicit requirements:
    Equilateral triangle has all three sides the same length
    Isosceles triangle has two out of three sides the same length
    Scalene triangle has all sides of different lengths
    All sides must have a length of >0 and not be negative
    The sum of the length of any two sides must be greater than the
    length of the third side. 

- Implicit requirements:
    Our 'kind' method should return a string ('equilateral', 
    isosceles, or scalene depending)
    When we create a Triangle object, it should return an 
    ArgumentError where either one of the sides is not less than 0
    OR the sum of the length of any two sides is not greater than 
    the length of the third. 

- Our examples/test cases are referred to in our implicit requirements and
have been provided

- Data structure
  I think we are fine to simply use three instance variables
  referring to an integer which relates to the length of the side.
  One for each side - no need to use an array here
  Return value of 'kind' method is a string

Algorithm:
  - In our constructor (initialize) method we should save the three 
  side lengths into three separate instance variables. 
  - In our constructor we should first check that the side values are
  all greater than 0.
    - Use helper method
    - If they are not raise ArgumentError
  - In our constructor we should then check that the sum of adding
  any two sides in the triangle will be greater than the length of 
  the third. 
    - Use helper method
    - If not the case, raise ArgumentError
  - Define a kind method
    - Take each of the lengths contained in the various instance 
    variables and place them in an array
      - Call uniq on the array and then take the length of the array.
        - If length is three it is scalene
        - If length is two it is isosceles
        - If length is one it is equilateral
=end

class Triangle
  
  def initialize(val1, val2, val3)
    @side1 = val1
    @side2 = val2
    @side3 = val3
    @sides = [@side1, @side2, @side3]

    raise ArgumentError if zero_or_less?
    raise ArgumentError if not_a_triangle?
  end

  def zero_or_less?
    @sides.any? {|side| side <= 0}
  end

  def not_a_triangle?
    return true if @side1 >= @side2 + @side3
    return true if @side2 >= @side1 + @side3
    return true if @side3 >= @side1 + @side2
    false
  end

  def kind
    if @sides.uniq.length == 3
      'scalene'
    elsif @sides.uniq.length == 2
      'isosceles'
    else 
      'equilateral'
    end
  end
  
end
  
