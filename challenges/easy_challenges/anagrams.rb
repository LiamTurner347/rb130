=begin
Write a program that takes a word and a list of possible anagrams
and selects the correct sublist that contains the anagrams 
of the word.

For example, given the word "listen" and a list of candidates 
like "enlists", "google", "inlets", and "banana", 
the program should return a list containing "inlets".

PEDAC
- Explicit rules:
  - We create a class that takes a string word
  - Our output is an array of strings containing all the strings in
  our inputted sublist that are anagrams of the word passed in on
instantiation of our class instance. 
- Implicit rules:
  - Where there are no matches, we should return an empty array.
  - The same word is not an anagram, whether upcase or downcase (guard)
  - An anagram needs to:
    - Contain the same count of all unique characters as the 
    matched word (case insensitive); 
    - Be the same length as the matched word

- Examples / test cases:
  - Provided with the problem

- Data structures
  - Input is a string (when instantiating our instance of the class)
  AND an array of strings when passing into our match method. 
  - Output is an array - empty when no matches and containing the 
  matched strings when there are matches. 

- Algorithm:
  - Create anagram class
  - Create constructor method:
    - Takes one string argument (pattern word)
    - Store the string argument. 
    - Does not return error. 
  - Create match method
   - Sort the pattern (downcase - array of chars - sort - join)
   - Create an empty array
   - Iterate through our list of potential matches
    - Next if the potential match downcased is equal to the pattern
    downcased
    - If the potential match (when sorted in same way as pattern) 
    is equal to the pattern, add the potential match to the array. 
    - return the array
=end

class Anagram

  attr_reader :pattern

  def initialize(pattern)
    @pattern = pattern
  end

  def match(word_array)
    anagrams = []
    compare_string = pattern.downcase.chars.sort.join

    word_array.each do |word|
      next if word.downcase == pattern.downcase
      sorted_word = word.downcase.chars.sort.join
      anagrams << word if sorted_word == compare_string
    end

    anagrams
  end
end
