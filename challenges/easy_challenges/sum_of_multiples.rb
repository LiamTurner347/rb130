=begin
Write a program that, given a natural number and a set of 
one or more other numbers, can find the sum of all the 
multiples of the numbers in the set that are less than 
the first number. If the set of numbers is not given, 
use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, 
but not including, 20 that are multiples of either 3 or 5, 
we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these 
multiples is 78.

PEDAC
1) Problem: 
  a) Explicit:
    - If a list of numbers is not passed in, use 3 and 5 as default. 


  b) Implicit:
    - Multiples must be less than the 'max' - cannot be the same

2) Examples / Test Cases:

3) Data Structure:
  -Input: Optional list of one or more numbers and a number 
  representing a 'max' level for calculating multiples. 
  -Output: Number representing the total of the multiples. 
  - Can use a collection i.e. an array to contain the multiples
  as we are identifying them. 

4) Algorithm: 
 - Create a Sum of Multiples class
 - Create a constructor method with one default parameter. 
    - The default should be set to [3, 5]
    - Use a * (splat operator to transform the passed in value to an array)
    - Save the array into @multiples
  - Create a to instance method that takes a max number as an arg
    - Create an empty results array
    - Iterate from 1 up to one less than the limiting value
      - If the current num is a multiple of any of the @multiples,
      add it to the results array
    - Take the results array and sum the values. Return the sum. 
  - Create a to class method that takes a max number as an arg
    - Create an instance of the class using the construcot method 
    (with no argument as using the default values 3 and 5), then call
    the instance to method on it with the max number as the arg. 
5) Code:
See below
=end

class SumOfMultiples

  attr_reader :multiples

  def initialize(*nums)
    @multiples = nums.empty? ? [3, 5] : nums
  end

  def to(max)
    results = []

    (1...max).each do |num|
      results << num if multiples.any? { |mult| num % mult == 0 }
    end
    
    results.sum
  end

  def self.to(max)
    SumOfMultiples.new.to(max)
  end

end