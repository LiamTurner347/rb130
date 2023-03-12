=begin
Write some code that converts modern decimal numbers 
into their Roman number equivalents.

The Romans wrote numbers using letters: 
  I, V, X, L, C, D, M. 
  
There is no need to be able to convert numbers larger 
than about 3000. (The Romans themselves didn't tend 
to go any higher)

Wikipedia says: Modern Roman numerals ... are written by 
expressing each digit separately starting with the left 
most digit and skipping any digit with a value of zero.

PEDAC
1) The Problem
- Explicit:
    - We take a decimal integer as a digit and need to return 
    a string roman numeral which represents the input number.
    - Only need to convert up to 3000.
    - We need to iterate through each digit in the input number
    starting from left to right:
      - If the digit is zero, we can ignore it.
- Implicit:
    - We need to create a RomanNumeral class. 
    - Our constructor method takes one input which is the input 
    integer. This can be saved into an instance variable (@decimal). 
    - We need to create a to_roman method that returns the roman 
    numeral string. 
      - This will likely need a helper method that does the heavy
      lifting. 

2) Examples / Test Cases:
  - Examples provided to us. 

3) Data Structure
  - Hash to contain the most common roman numerals (as keys) and their 
  conversion to decimal values (as values). 
  - Use an array to hold the roman numeral as we build it up. Return
  the joined string once the conversion is complete. 
  - Input = decimal integer
  - Output = string

4) Algorithm
 - Create RomanNumeral class
 - Design constructor method that:
    - Takes one decimal integer argument and saves it into
    an instance variable @decimal
    - No errors to be raised.
 - Create a conversion constant inside the class that contains a 
  hash dictionary containing key conversions between roman numerals
  and decimal numbers. 
 - Create a to_roman method:
  - This should return the roman numeral equivalent of the number
  - Clone the decimal value contained in @decimal. 
  - Until the cloned value = 0
  - Create empty numerals array
  - Find the key decimal value in the conversion constant that is
  the highest decimal value that is less than or equal to decimal 
  (maybe use bsearch)
    - Take the roman numeral associated with that value and place
    it in an array. 
    - Subtract the value from decimal
  - Join the numerals array together as the return value. 

5) Code
See below
=end

class RomanNumeral

  attr_reader :decimal

  CONVERSION = {1 => "I", 4 => "IV", 5 => "V", 9 => "IX",
                10 => "X", 40 => "XL", 50 => "L", 90 => "XC",
                100 => "C", 400 => "CD", 500 => "D", 900 => "CM", 
                1000 => "M"}       
                
  def initialize(number)
    @decimal = number
  end

  def to_roman
    value = decimal.clone
    numerals_arr = []

    until value == 0 do 
      highest_num = CONVERSION.keys.select{ |element| element <= value }.last
      numerals_arr << CONVERSION[highest_num]
      value -= highest_num
    end

    numerals_arr.join
  end

end

