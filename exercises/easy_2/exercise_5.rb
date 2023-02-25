def drop_while(collection)
  new_array = []
  add_value = false
  collection.each do |value|
    if add_value == false
      if !yield(value)
        new_array << value
        add_value = true
      end
    else
      new_array << value
    end
  end
  new_array
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []