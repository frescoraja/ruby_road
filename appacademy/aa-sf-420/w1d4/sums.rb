#methods outside class (main class methods, called with arguments)
# def sums_rec(array)
#   return array.first if array.count < 2
#   array[0] + sums_rec(array.drop(1))
# end
#
# def sums_iter(array)
#   sum = 0
#   array.each do |el|
#     sum += el
#   end
#   sum
# end


#class methods, monkeypatching Array class
class Array
  def sums_rec
    return first if count < 2
    self[0] + drop(1).sums_rec
  end

  def sums_iter
    sum = 0
    each do |el|
      sum += el
    end
    sum
  end
end
