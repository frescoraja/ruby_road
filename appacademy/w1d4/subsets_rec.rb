# class Array
#
#   def subsets
#       return [[]] if count < 1
#       subs = self.take(count - 1).subsets
#       subs.concat(subs.map { |el| el + [last] })
#   end
# end
def subsets(array)
  return [[]] if array.empty?
  last = array.last
  subs = subsets(array.take(array.count - 1))
  last_subs = subs.map { |el| el + [last] }
  subs + last_subs
end
