=begin
The Greek mathematician Nicomachus devised a classification 
scheme for natural numbers (1, 2, 3, ...), identifying each 
as belonging uniquely to the categories of 
abundant, perfect, or deficient based on a comparison between 
the number and the sum of its positive divisors (the numbers 
that can be evenly divided into the target number with 
no remainder, excluding the number itself). For instance, 
the positive divisors of 15 are 1, 3, and 5. This sum is 
known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

Write a program that can tell whether a number is perfect, 
abundant, or deficient.

PEDAC

1. Problem
  a) Explicit
    - Take a number and return a string confirming whether the
    number is 'perfect', 'abundant' or 'deficient'
    - A perfect number is where the sum of its divisors (excluding
    the number itself) add to make the number.
    - An abundant number = more than the number
    - A deficient number = less than the number
  b) Implicit
    - Negative numbers should return error. 

2. Examples / Test Cases
  - See test file

3. Data Structure
  - Input = number
  - Output = string confirming whether perfect, abundant or deficient
  - May want array to store all divisors - can then use inject to add

4. Algorithm
  - Create a PerfectNumber class
  - From test cases, doesn't seem like we need an initialize class.
    - However, create one which takes one arg and turns it into
instance variable number 
  - Need a classify class method (self.classify) which takes one arg.
    - Need to calculate the divisiors / aliquot sum (separate method?)
      - Create empty array
      - Iterate from 1 to one less than number
        - For each number, ask whether original num % num == 0
        - if it does, add it to an array
      - Return result of calling inject on array and adding all
    - If aliquot = original, perfect etc etc.

5. Code
  - See below
=end

class PerfectNumber
  attr_reader :value

  def initialize(num)
    @value = num
  end

  def self.classify(num)
    raise StandardError if num < 0
    number = PerfectNumber.new(num)

    if number.aliquot == number.value
      "perfect"
    elsif number.aliquot > number.value
      "abundant"
    else 
      "deficient"
    end
  end
  
  def aliquot
    (1...value).select { |num| value % num == 0 }.inject(&:+)
  end
end