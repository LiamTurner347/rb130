=begin
Write a program that will take a string of digits and return 
all the possible consecutive number series of a specified 
length in that string.

For example, the string "01234" has the following 

3-digit series:

- 012
- 123
- 234

Likewise, here are the 4-digit series:

- 0123
- 1234

Finally, if you ask for a 6-digit series from a 
5-digit string, you should throw an error.

PEDAC
1) Problem
  Take a number represented by a string. Split it into all 
  consecutive sub numbers of the original string of a specific
  length

  a) Explicit
    - We have a number that we have to split - the number is 
    represented by a string
    - We have another number that represents the size of the 
    splits

  b) Implicit
    - In the event the split number is greater than the 
    length of the original input number string - return ArgumentError
    - We need to iterate to the index which is the length of the
input string less the split number

2) Examples/Test Cases
  - We need to create a Series class
  - Within that series class we should have a constructor method 
  that takes one argument (the input string)
  - We then need a slices instance method that takes one argument
  representing the length of the slices

3) Data Structure
  - Input: String representing our number which is to be sliced 
  and an integer representing the length of the slices
  - Output: An array containing sub arrays. Each subarrays contains
  each individual integer from the relevant slice. 

4) Algorithm
  - Create a Series class
  - Create a constructor method that takes one argument 
    - Assign this to the @number instance variable 
    - Create an attr_reader for number
  - Create a slices method that takes one argument:
    - Raise ArgumentError if invalid?
      - Invalid? helper method: pass in the argument number and
      return true if argument number greater than length of @number
    - We need to take consecutive slices of the relevant length
      - Initial slices array 
      - Iterate from 0 to length of @number - slice length. 
        - number.slice(idx, length).chars.to_i
      - Now we have an array of substrings
        - We need to split each of those substrings into chars
        and map them to 

5) Code
See below
=end

class Series

  attr_reader :number

  def initialize(num)
    @number = num
  end

  def slices(length)
    raise ArgumentError if invalid?(length)
    calculate_slices(length)
  end

  private

  def invalid?(length)
    length > number.length
  end

  def calculate_slices(length)
    string_array = []
    (0..(number.length - length)).each do |idx|
      string_array << number.slice(idx, length).chars
    end

    string_array.map do |sub_arr|
      sub_arr.map do |char|
        char.to_i
      end
    end
  end
end

