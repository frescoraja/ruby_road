def merge_sort(array)
  return array if array.count <= 1

  mid = array.count / 2
  left = merge_sort(array.take(mid))
  right = merge_sort(array.drop(mid))
  merge(left, right)
end

def merge(array1, array2)
  if array1.empty?
    array2
  elsif array2.empty?
    array1
  elsif array1.first < array2.first
    [array1.first] + merge(array1[1..array1.length], array2)
  else
    [array2.first] + merge(array1, array2[1..array2.length])
  end
end
