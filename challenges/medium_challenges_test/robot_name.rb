=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name.
The first time you boot them up, a random name is generated,
such as RX837 or BC811.

Every once in a while, we need to reset a robot to its
factory settings, which means that their name gets wiped.
The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable
sequence. Random names means there is a risk of collisions.
Your solution should not allow the use of the same name twice.

PEDAC
1) Problem
  Write a program that can generate random and unique robot names.
  The program should also be able to wipe the robot's name.

  a) Explicit
  - The name must follow a pattern of 2 uppercase alhpabetic chars
  followed by three digits

  b) Implicit

2) Examples/Test Cases
  - Class named Robot
  - When we instantiate an instance of the Robot class, it should have
  a @name instance variable made up of 2 uppercase letters, followed by
  3 lowercase letters (could use a helper method and letter / number
  array constants for this)
  - Need at attr_reader for :name
  - Need a reset instance method that can change the name (to another
  5 letter word with 2 uppercase letters followed by 3 digits).

3) Data Structure
  - Input: No input
  - Output: The output will be a string
  - Use a class level array to track names already created (and remove
  them when we reset) to prevent collisions

4) Algorithm
  - Create a Robot class
  - Create a class variable 'names' and assign it to an empty array.
  - Create a constant of ["A".."Z".to_a]
  - Create a constant of ["0..9".to_a]
  This will store the names we generate.
  - Create a constructor method
    - Create a @robot_name instance variable and do not set it.
  - Create a name method
    - Check whether the calling instance's @robot_name is equal to nil
    - If it is, we need to generate a name.
      - Generate_name helper method.
      - Set @robot_name to return value of generate_name helper method.
    - If it is not, we need to just return the name.
    - Within generate_name helper method
      - Create an empty gen_name string
      - Loop do
        - Two times - push a random constant LETTER to the array
        - Three times - push a random constant NUMBER to the array.
        - break if !(@@names.include?(gen_name.join))
      - store_name helper method
      - gen_name.join returned
    - Within store_name helper method
      - @@names << gen_name.join
  - Create a reset method
    - Need to remove the @robot_name from @@names
    - Need to set @robot_name to nil
    - Call 'name' on the robot to generate a new name, ensure it is
    unique and save it in @@names - as above.

5) Code
See below
=end

class Robot
  LETTERS = ("A".."Z").to_a
  NUMBERS = ("0".."9").to_a

  @@names = []

  attr_accessor :robot_name

  def initialize
    @robot_name
  end

  def name
    if robot_name.nil?
      self.robot_name = generate_name
    else
      robot_name
    end
  end

  def generate_name
    generated_name = ""

    loop do
      2.times { |_| generated_name << LETTERS.sample }
      3.times { |_| generated_name << NUMBERS.sample }
      break unless @@names.include?(generated_name)
      generated_name = ""
    end

    @@names << generated_name
    generated_name
  end

  def reset
    @@names.delete(robot_name)
    self.robot_name = nil
    name
  end
end
