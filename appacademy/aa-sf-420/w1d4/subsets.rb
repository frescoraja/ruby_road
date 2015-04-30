def subsets(array)
  size = array.count
  return [array] if array.empty?
  subs = subsets(array.take(size - 1))
  subs + subs.map { |sub| sub + [array.last] }
end
