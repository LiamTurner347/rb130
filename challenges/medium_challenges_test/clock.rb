=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes
from the time represented by a given Clock object. Note that
you should not mutate Clock objects when adding and
subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should
be equal to each other.

You may not use any built-in date or time functionality;
just use arithmetic operations.

PEDAC
1) Problem
  a) Explicit

  b) Implicit

2) Examples / Test Cases
  - Create a Clock class
  - Create a constructor method (two arguments, hours and minutes)
    - Should have two instance variables: hours and minutes (and total minutes?)
  - Create an 'at' class method
    - Accepts two arguments (one for hours and one for minutes)
      - Default minutes set to 0
    - Returns a new clock object with hours and minutes set accordingly.
  - Create a to_s instance method
    - Should return properly formatted string representing time.
    - Will need to left pad zeroes in string.
  - Need a + method
    - Takes one argument representing the number of minutes to be added
    - Adds the number of minutes and calculates the new hours and minutes.
    - Returns a new clock with updated hours and minutes (note, should wrap
    around days)
      - Note if hours negative - do 24 + hours to get proper hours.
  - Need a - method
    - Does the same as the + but other way round
  - Need a == method
    - two clock objects are equal if the hours and minutes are the same.

3) Data Structure
  Input: One or two integers representing hours and minutes

4) Algorithm
  - Create a Clock class
  - Create a constructor method (two arguments, hours and minutes)
    - @hours
    - @minutes
    - @total_minutes?
  - Create an at class method

5) Code
See below
=end

class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def to_s
    hour_string = format("%02d", hours)
    minute_string = format("%02d", minutes)
    "#{hour_string}:#{minute_string}"
  end

  def +(added_mins)
    total_minutes = (hours * 60) + minutes + added_mins
    updated_hours = (total_minutes % 1440) / 60
    updated_hours = 24 + updated_hours if updated_hours < 0
    updated_minutes = (total_minutes % 1440) % 60
    Clock.new(updated_hours, updated_minutes)
  end

  def -(subtracted_mins)
    total_minutes = (hours * 60) + minutes - subtracted_mins
    updated_hours = (total_minutes % 1440) / 60
    updated_hours = 24 + updated_hours if updated_hours < 0
    updated_minutes = (total_minutes % 1440) % 60
    Clock.new(updated_hours, updated_minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
end
