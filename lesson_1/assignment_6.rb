def each(array)
  counter = 0

  while counter < array.size do
    yield(array[counter]) if block_given?
    counter += 1
  end

  array
end

return_val = each([1, 2, 3, 4, 5]) {|num| puts num}.select{ |num| num.odd? }     # => [1, 3, 5]

p return_val

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]