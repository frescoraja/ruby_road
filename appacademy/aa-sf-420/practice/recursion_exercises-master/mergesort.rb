class Array
  def merge_sort
    return self if count <= 1
    left = take(count/2)
    right = drop(count/2)
    Array.merge(left.merge_sort, right.merge_sort)
  end

  def self.merge(left, right)
    merged = []
    until left.empty? || right.empty?
      case left.first <=> right.first
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged += left
    merged += right
  end
end
