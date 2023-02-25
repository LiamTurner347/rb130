=begin
def missing(array)
  new_array = []

  (array.first).upto(array.last) do |num|
    new_array << num unless array.include?(num)
  end

  new_array
end
=end

def missing(array)
  ((array.min..array.max).to_a - array).sort
end

p missing([-3, -2, 1, 5]) # == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) # == []
p missing([1, 5]) # == [2, 3, 4]
p missing([6]) # == []