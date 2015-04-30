class Array
  def my_inject(accumulator = nil, &prc)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end
    while i < length
      accumulator = prc.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

def is_prime?(num)
  (2...num).none? { |fact| num % fact == 0}
end

def primes(count)
  primes = []
  i = 2
  until primes.count >= count
    primes << i if is_prime?(i)
    i += 1
  end
  primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  if num == 1
    [num]
  else
    factorials = factorials_rec(num - 1)
    factorials << factorials.last * (num - 1)
    factorials
  end
end

# class Array
#   def dups
#     dups = Hash.new([])
#
#     each_with_index do |item, idx|
#       if dups[item].empty?
#         dups[item] = [idx]
#       else
#         dups[item] << idx
#       end
#     end
#     dups.select { |key, value| dups[key].size > 1 }
#   end
# end

class Array
  def dups
    dups = Hash.new { |hash, key| hash[key] = [] }

    each_with_index do |item, idx|
      dups[item] << idx
    end
    dups.select { |key, value| value.count > 1 }
  end
end

class String
  def symmetric_substrings
    sym_strings = []
    length.times do |start_pos|
      (2..(length-start_pos)).each do |leng|
        substring = self[start_pos,leng]
        sym_strings << substring if substring == substring.reverse
      end
    end
    sym_strings
  end
end

class Array
  def merge_sort(&prc)
    prc ||= proc { |x,y| x <=> y }

    return self if count <= 1
    Array.merge(
      self.take(count / 2).merge_sort(&prc),
        self.drop(count / 2).merge_sort(&prc),
        &prc
        )
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end
end
