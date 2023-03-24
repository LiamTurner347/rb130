=begin
Meetups are a great way to meet people who share a common interest. 
Typically, meetups happen monthly on the same day of the week. 
For example, a meetup's meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The tenth Wednesday of December 2020
The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date. 
Each object takes a month number (1-12) and a year (e.g., 2021). 
Your object should be able to determine the exact date of the meeting 
in the specified month and year. For instance, if you ask 
for the 2nd Wednesday of May 2021, the object should be able to 
determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 
'fourth', 'fifth', 'last', and 'teenth'. 

The case of the strings is not important; 
that is, 'first' and 'fIrSt' are equivalent. 
Note that "teenth" is a made up word. There was a meetup whose members 
realised that there are exactly 7 days that end in '-teenth'. 
Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) 
will have exactly one date that is the "teenth" of that day in every month. 
That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. 
The fifth day of the month may not happen every month, but some meetup groups 
like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 
'Thursday', 'Friday', 'Saturday', and 'Sunday'. 
Again, the case of the strings is not important.

PEDAC

1) Problem
  a) Explicit
    - We are given a month number (1-12) and a year.
    - We are given a descriptor i.e. first, second, third, fourth, fifth, last or teenth
    - We are given a day i.e. Mon-Sun
    - The case of the strings are not important so this input should be downcased
    to standardise
    - Based on this information, we need to calculate the DATE of the month on which 
    the meetup will occur. 

  b) Implicit
    - The 'first' week will always be 1-7
    - The 'second' week will always be 8-14
    - The 'third' week will always be 15-21
    - The 'forth' week will always be 22-28
    - The 'fifth' week (if there is one) will be 29-31
    - The 'last' week could be between 22-31 (depending on number of days in the month)
    - The 'teenth' week will always be 13-19
    - April, June, September and November have 30 days
    - February has 28 in most years, but 29 in leap years. 
    - All other months have 31 days. 

2) Examples / test cases
  - We need a constructor method that takes two arguments - year and month number. 
  - We need a 'day' instance method that takes a string representing the day and
  a string representing the week (i.e. first, teenth etc). 
    - In this method, we need to calculate the correct date associated with the 
info provided and return this as a Date object. 
    - May need helper methods to achieve this 

3) Data Structure
  - Working with date objects. 
  - May want to use collections i.e. hashes to hold key information. 
    - Weeks hash with descriptor as key and possible dates as values (in an array?)
    - Days hash that associates each day of the week with a number 1-7

4) Algorithm
  - Create our Meetup class
  - Create constructor method with two arguments
    -@year = year
    -@month = month
  - Create our day instance method with two arguments
    -@day = day.downcase
    -@week_descriptor = week.downcase
    -using the @week_descriptor, figure out what the possible days are. 
      - iterate through each of those days and use cwday to figure out which of those
      dates correspond with our @day.
      - need to deal with edge cases too: 
        - The 'fifth' week and 'last' week dates will be different depending on the month
  - Create hashes for weeks and days
=end

class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_possible_day + 6, @days_in_month].min

    (first_possible_day..last_possible_day).detect do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  private

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end