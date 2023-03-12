=begin
Write a program that, given a word, 
computes the Scrabble score for that word.

PEDAC
1) Problem
-Explicit:
  - Each letter in the word has a specific value.
  - Each letter, even if repeated, counts towards the value. 

-Implicit:
  - An empty word scores zero.
  - Whitespace scores zero. 
  - Nil scores zero.
  - Scores are case insensitive

2) Examples / Test Case:
  - Examples provided with the problem

3) Data Structure
  - Input = words for which we need to calculate Scrabble score.
  - Output = number representing the Scrabble score. 
  - We need to deal with invalid input i.e. anything that is not
  a string of alphabetic letters (i.e. it is a string and all characters
  are a-z)
  - Use a hash to keep track of the scoring standard. 
  - Turn our word into an array when we want to iterate through each
  character to increment the score. 

4) Algorithm
  - Create Scrabble class.
  - Create a hash dictionary containing the letters in an array as keys
  and the corresponding numeric values (as values) 
  - Constructor method accepts one argument (representing the scrabble word)
  - Define a score instance method that: 
    - takes no arguments
    - returns the score of the scrabble word for the calling object 
    (i.e. instance of the scrabble class)
    - Invalid words should return a score of 0
    - Words are case insensitive
    To do this: 
      - Check that the word is valid
        - return 0 unless valid?(word)
          - valid checks that the word is a string AND that all
          characters are letters (use regex?)
        - set a counter to 0
        - take the word, upcase it and iterate through each character
          - iterate through each of the hash's key arrays:
            - if the array includes the character, increment the counter
            by the value associated with the relevant key. 
        - return the counter. 
  - create a score class method that does pretty much the same thing. 
  - Define a Scrabble class method that (self.score):
    - Takes a single argument that contains the Scrabble word and
    returns its score. 


5) Code
  - Below
=end

class Scrabble

  attr_reader :word

  SCRABBLE_SCORES = {%w(A E I O U L N R S T) => 1,
                    %w(D G) => 2,
                    %w(B C M P) => 3,
                    %w(F H V W Y) => 4,
                    %w(K) => 5,
                    %w(J X) => 8,
                    %w(Q Z) => 10}

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless valid?
    calculate_score
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def valid?
    word.class == String && word.chars.all? { |char| char.match?(/[a-z]/i) }
  end

  def calculate_score
    counter = 0
    word.upcase.chars.each do |char|
      SCRABBLE_SCORES.keys.each do |array|
        counter += SCRABBLE_SCORES[array] if array.include?(char)
      end
    end
    counter
  end
end

