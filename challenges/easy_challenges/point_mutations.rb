=begin
Write a program that can calculate the Hamming distance 
between two DNA strands.

A mutation is simply a mistake that occurs during the 
creation or copying of a nucleic acid, in particular DNA. 
Because nucleic acids are vital to cellular functions, 
mutations tend to cause a ripple effect throughout the cell. 
Although mutations are technically mistakes, a very rare 
mutation may equip the cell with a beneficial attribute. 
In fact, the macro effects of evolution are attributable 
to the accumulated result of beneficial microscopic mutations 
over many generations.

The simplest and most common type of nucleic acid mutation 
is a point mutation, which replaces one base with another 
at a single nucleotide.

By counting the number of differences between two homologous
DNA strands taken from different genomes with a common ancestor,
we get a measure of the minimum number of point mutations 
that could have occurred on the evolutionary path between 
the two strands.

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal 
length. If you have two sequences of unequal length, you 
should compute the Hamming distance over the shorter length.

PEDAC
-Understand the Problem:
-Explicit:
  - The Hamming Distance is essentially the number of characters
  in two strings that are at the same index of the string but
  are different
  - If we have two sequences of unequal length, we compute up to
  the hamming distance over the shorter length.
-Implicit:
  - The input will be a string of uppercase chars of random length
  - The output will be an integer representing hamming distance
  - We should return 0 when both strings are empty. 

- Examples / Test Cases:
    - Provided to us. 
    - Need a DNA class with constructor method that takes one 
    string argument representing a DNA strand
    - Can store this in an instance variable
    - Then need a hamming_distance method that takes a second
    string argument representing the other DNA strand. This method 
    should return an integer representing the hamming distance.

- Data Structure
    -Input: String
    -Output: Integer

- Algorithm:
    -Create DNA class with constructor which accepts one argument. 
      - Create instance variable in constructor to represent the string
    - Create hamming distance method which accepts one argument (other
    strand)
      - Within method determine which of the strands is shorter 
      (could use helper method here) by comparing the length of the 
      strings. 
      - Create a counter set to 0
      - Take the shorter string and iterate through each char (with index)
       - If iterated value different to value at same index of other string
       add 1 to counter
      - return counter
=end

class DNA

  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    if strand.length <= other_strand.length
      string = strand
      other_string = other_strand
    else
      string = other_strand
      other_string = strand
    end

    counter = 0

    string.chars.each_with_index do |char, index|
      counter += 1 if char != other_string[index]
    end

    counter
  end
end


