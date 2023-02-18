def reduce(array, default=nil)
  if default == nil 
    accumulator = array[0] 
    counter = 1
  else
    accumulator = default
    counter = 0
  end

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  p accumulator
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']