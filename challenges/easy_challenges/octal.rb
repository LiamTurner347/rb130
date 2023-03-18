=begin
Implement octal to decimal conversion. Given an octal input string, 
your program should produce a decimal output. 
Treat invalid input as octal 0.

Octal numbers are similar, but they use a base-8 system. 
A number 233 in base 8 can be understood as a linear combination 
of powers of 8:

The rightmost digit gets multiplied by 8**0 = 1
The next digit gets multiplied by 8**1 = 8
The digit after that gets multiplied by 8**2 = 64
The digit after that gets multiplied by 8**3 = 512
...
The n'th digit gets multiplied by 8n-1.
All of these values are then summed.

Therefore, 
  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

So, the decimal equivalent of octal 233 is decimal 155

PEDAC
1. Problem
  a) Explicit
    - To convert an octal number to a decimal number,
    we take each digit in the number and times it by (8 to a 
    certain power) depending on the digit's position in the number
    and the length of the number. 

  b) Implicit
    - If any of the characters in the input string are not 0-7
inclusive, return 0

2. Examples / Test Cases
- Provided with problem

3. Data Structure
- Input is a string
- Output is an integer

4. Algorithm:
- Define an Octal class
- Define an initialize method that takes one argument, the input string
  - Set that input equal to the instance variable 'input_num'
- Define a to_decimal method
  - Return 0 if invalid? (helper method)
  - Calculate_decimal helper method - this will provide our return value.
- Define invalid? helper method
  - Takes input_num and returns true if any character in the string
  is not 0-7 (use regex)
- Define calculate_decimal method
  - Split the input string into its characters and map them into
  an arry of integers
  - Set a counter equal to 0
  - Take the length of the array and store it in a variable.
  - Array each with index
    - For each character in the array, multiply it by 
    (8 ** (length - index + 1))
    - add this value to the counter
  - Return the counter
=end

class Octal
  
  def initialize(num)
    @input_num = num
  end

  def to_decimal
    return 0 if invalid?
    calculate_decimal
  end

  private

  attr_reader :input_num

  def invalid?
    input_num.match?(/[^0-7]/)
  end

  def calculate_decimal
    counter = 0
    num_arr = input_num.chars.map(&:to_i)
    
    num_arr.each_with_index do |num, idx|
      counter += (num * (8 ** (num_arr.length - (idx + 1))))
    end
    
    counter
  end
end