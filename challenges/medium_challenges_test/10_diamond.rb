=begin
The diamond exercise takes as its input a letter, and outputs it
in a diamond shape. Given a letter, it prints a diamond starting
with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two
identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

PEDAC
1) Problem
  - Create a diamond of letters with the input letter in the middle.
  a) Explicit
    - The first row contains one 'A'.
    - The last row contains one 'A'.
    - All rows, except the first and last, have exactly two
    identical letters.
    - The diamond is horizontally symmetric.
    - The diamond is vertically symmetric.
    - The diamond has a square shape (width equals height).
    - The letters form a diamond shape.
    - The top half has the letters in ascending order.
    - The bottom half has the letters in descending order.
    - The four corners (containing the spaces) are triangles.
  b) Implicit
    - May need to distinguish between "A" and any other letter
    - May need to distinguish between first row, last row and middle rows
2) Examples / Test Cases
  - Diamond for letter "A"
  A

  - Diamond for letter "C"
   A
  B B
 C   C
  B B
   A

3) Data Structure
  - Input = an uppercase string character representing the 'middle'
  letter
  - Output one or more strings representing the diamond.
  - Array to iterate through letters as we construct diamond

4) Algorithm
  - Create a Diamond class
  - Within that Diamond class, we need a make_diamond method that takes
  one argument representing the 'middle letter'
    - return "A\n" if middle_letter = "A"
    Otherwise:
      - output "A_line" - helper method
      - output middle_lines - helper method
      - output "A_line"
  - A_line helper method
    - (middle_digit.ord - "A".ord) spaces + A + same again + newline
  - middle_lines
    - Create array from "B" to middle digit. Iterate through
      - For each digit, we want to create:
        - outside_spaces = "middle_digit.ord" - iterated digit.ord spaces
        - iterated digit
        - middle_spaces = (((iterated digit.ord - "B".ord) x 2) + 1) spaces
        - iterated digit
        - outside_spaces
        - newline
    - Reverse the array and shift the first value
    - Iterate through this and create more lines using same process
5) Code
See below
=end

class Diamond
  attr_reader :middle_letter

  def initialize(middle_letter)
    @middle_letter = middle_letter
  end

  def self.make_diamond(middle_letter)
    diamond = Diamond.new(middle_letter)
    if diamond.middle_letter == "A"
      "A\n"
    else
      arr = [diamond.outside_line, diamond.middle_lines, diamond.outside_line]
      arr.flatten.join
    end
  end

  def outside_line
    outer_spaces = " " * (middle_letter.ord - "A".ord)
    ["#{outer_spaces}A#{outer_spaces}\n"]
  end

  def middle_lines
    lines_array = []
    letter_array = ("B"..middle_letter).to_a
    letter_array.each { |char| lines_array << make_line(char) }

    letter_array.reverse!.shift
    letter_array.each { |char| lines_array << make_line(char) }
    lines_array
  end

  def make_line(display_letter)
    outer_spaces = " " * (middle_letter.ord - display_letter.ord)
    middle_spaces = " " * (((display_letter.ord - "B".ord) * 2) + 1)
    "#{outer_spaces}#{display_letter}#{middle_spaces}" \
      "#{display_letter}#{outer_spaces}\n"
  end
end
