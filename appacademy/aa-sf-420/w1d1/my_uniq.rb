class Array
  def my_uniq
    new_arr = []
    self.each do |n|
      if (!new_arr.include?(n)) #new_arr.push(n) unless new_arr.include?(n)
        new_arr.push(n)
      end
    end
    new_arr
  end
  # Alternatively with inject:
  #
  # def my_uniq(array)
  #   array.inject([]) do |uniq_array, el|
  #     uniq_array << el unless uniq_array.include?(el)
  #     uniq_array
  #   end
  # end
#
#  def two_sum
#    indices = []
#    self.each_index do |i|
#      for j in i+1..self.length-1
#        if self[i] + self[j] == 0
#          indices << [i,j]
#        end
#      end
#    end
#    indices
#  end




  def my_transpose
    final = []
    for i in 0...self.length
      transposed = []
      for j in 0...self.length
        transposed << self[j][i]
      end
      final << transposed
    end
    final
  end
end


def two_sum(array)
    pairs = []

    array.count.times do |i|
      (i+1).upto(array.count-1) do |j|
        pairs << [i,j] if arr[i] + arr[j] == 0
      end
    end
    pairs
end



arr =  [1,7,6,5,6,2,1,1,3,3,2,3,4,5,4,4,5,7]
puts arr.my_uniq.inspect

arr = [-1, 0, 2, -2, 1]
p arr.two_sum

rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
  p rows.my_transpose
