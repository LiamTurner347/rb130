def zip(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |item, index|
    new_arr << [item, arr2[index]]
  end

  new_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
