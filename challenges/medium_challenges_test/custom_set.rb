=begin
Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type,
like a set. In this exercise you will define your own set type. How it works
internally doesn't matter, as long as it behaves like a set of unique
elements that can be manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set
type. For this problem, you're expected to implement your own custom
set type. Once you've reached a solution, feel free to play around with
using the built-in implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.

PEDAC

1) Problem
  - We can assume all elements of a set will be a number

2) Examples / Test Cases

3) Data Structure
 - Seems like an array is a good data structure for holding a set

4) Algorithm
  - Create a CustomSet class
  - Create constructor method
    - Takes one default argument that defaults to []
    - @set = array
  - Create empty? instance method
    - Check whether @set.empty?
  - Create contains? instance method that takes one argument
    - Check whether @set.include?(argument)
  - Create subset? instance method that:
    - takes a CustomSet object as an argument
    - returns true if calling object 'empty?'
    - else returns true if
      - each element in the calling object's set is contained in the argument se
  - Create disjoint? instance method
    - takes a CustomSet object as an argument
    - returns true if empty? || other.empty?
    - returns false if any of the elements in the calling object's set is contai
in the argument set
  - Create eql? instance method
    - Takes a CustomSet object as an argument
    - Returns true if the calling object and the argument's sets both contai
    same numbers (duplicates don't matter)
  - Create add instance method (takes one argument - a number)
    - Adds the number to @set unless @set.contains?(number)
  - Create intersection instance method
    -Takes one argument - a CustomSet object
    - Returns a new CustomSet object with an @set containing the values which b
    the calling object and rhe argument object contain
    - Create a intersection_set equal to calling the select method on each argu
    of the calling object's set and selecting if the relevant value is contain
    the argument object's set
    - CustomSet.new(intersection_set)
  - Create differnet instance method
    - Returns new CustomSet object containing set array with all numbers in call
    objects set that are not included in argument object's set.
=end

class CustomSet
  attr_reader :set

  def initialize(array = [])
    @set = array
  end

  def empty?
    @set.empty?
  end

  def contains?(number)
    @set.include?(number)
  end

  def subset?(other)
    return true if empty?

    @set.all? { |num| other.contains?(num) }
  end

  def disjoint?(other)
    return true if empty? || other.empty?

    !(@set.any? { |num| other.contains?(num) })
  end

  def eql?(other)
    @set.uniq.sort == other.set.uniq.sort
  end

  def add(number)
    @set << number unless contains?(number)
    self
  end

  def ==(other)
    @set == other.set
  end

  def intersection(other)
    intersection_set = set.select { |num| other.contains?(num) }
    CustomSet.new(intersection_set)
  end

  def difference(other)
    difference_set = set.select { |num| !(other.contains?(num)) }
    CustomSet.new(difference_set)
  end

  def union(other)
    new_set = CustomSet.new(@set.clone)
    other.set.each do |num|
      new_set.add(num)
    end
    new_set.set.sort!

    new_set
  end
end
