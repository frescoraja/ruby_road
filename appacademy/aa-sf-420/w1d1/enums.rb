#!/user/bin/env ruby

class Array

  def timestwo
    self.map { |n| n*2}
  end



  def my_each(&proc)
    self.map do |n|
      proc.call(n)
    end
    self
  end

  def median
    n = self.size
		arr = self.sort
    median = 0
    if (n % 2 == 0)
      median = (arr[n/2 - 1] + arr[n/2]).fdiv(2)
    else
      median = arr[n/2]
    end
    median
  end

end


def concatenate(arr)
  arr.inject(:+)
end
