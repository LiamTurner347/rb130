=begin
Create own 'times' method

Integer#times example:

5.times do |num|
  puts num
end

0
1
2
3
4
=> 5
=end

def times(num)
  counter = 0
  until counter == num do
    yield(counter) if block_given?
    counter += 1
  end
  num
end

times(5) do |num|
  puts num
end
