=begin
Write a program that can generate the lyrics of the 
99 Bottles of Beer song. See the test suite for the entire song.

PEDAC
1) Problem
a) Explicit
  - The bottle of beer song features a number of two line verses
  - 99 down to 1 are the same just with different numbers
  - 1 is the same as the rest but singular instead of plural, with
  a different second line
  - 0 is different again
b) Implicit
  - Need to be able to select the verse by passing in a number
  - We need to be able to provide a range of verses and ask Ruby
  to provide all the verses in that range. 

2) Examples / Test Cases:
 - BeerSong class
 - BeerSong verse class method - one argument for the relevant
 verse to be returned,
 - BeerSong verses class method - accepts two arguments being
 start and end verses range. First arg should be greater than second. 
 - BeerSong lyrics class method - play the whole song from 
 verse 99 down to 0

 3) Data Structure 
 - Input is a number usually
 - Output is a multiline string
 - May want to consider using a heredoc

 4) Algorithm:
- Create BeerSong class
- Create verse class
  - Should have constructor that takes the bottle number
- Create verse class method in Beersong class
  - Takes one argument
  - Creates a new Verse object and passes in the argument as 
  the initialisation, calling the Verse#single_verse return value
  - This should return the relevant verse, which will be different
based on whether this is 99-3 or 2 or 1 or 0
  - Our single verse method can use a case statement to determine
  the number
    - If 0, zero verse 
    - If 1, one verse
    - If 2, two verse
    - Else, default verse
    - zero verse, one verse, two verse and default verse are each their own method
    within the Verse class. 
- Create verses class method
  - This takes two arguments, a start and a stop
  - Iterate from the start to the stop and, in each case, call
  the verse method and pass in the iterated value as the argument
  - Pass the result of calling the verse method on the argyument into an array
  - Return the joined array and separate each verse with a newline. 
- Create lyrics class method
  - This can leverage the verses class method and call this with start
  argument of 99 and end argument of 0
=end

class Verse
  attr_reader :bottle_number

  def initialize(num)
    @bottle_number = num
  end

  def single_verse
    case bottle_number
    when 0
      zero_bottles
    when 1
      one_bottle
    when 2
      two_bottles
    else
      default_verse
    end
  end

  def zero_bottles
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end

  def one_bottle
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of " +
    "beer on the wall.\n"
  end

  def two_bottles
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def default_verse
    "#{bottle_number} bottles of beer on the wall, " +
    "#{bottle_number} bottles of beer.\nTake one down " +
    "and pass it around, #{bottle_number - 1} bottles " +
    "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(num)
    Verse.new(num).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << verse(current_verse)
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end