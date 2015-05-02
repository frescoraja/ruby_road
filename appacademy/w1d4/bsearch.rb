def bsearch(arr, num)
  return nil if arr.empty?

  pivot = arr.count / 2

  case arr[pivot] <=> num
  when 1
    return bsearch(arr.take(pivot), num)
  when 0
    return pivot
  when -1
    result = bsearch(arr.drop(pivot + 1), num)
    return result.nil? ? result : result + pivot + 1
  end
end
class Array
  def binary_search(target)
    return nil if empty?

    pivot = count / 2

    case self[pivot] <=> target
    when -1
      result = drop(pivot + 1).binary_search(target)
      result.nil? ? result : result + pivot + 1
    when 0
      return pivot
    when 1
      return take(pivot).binary_search(target)
    end
  end
end
