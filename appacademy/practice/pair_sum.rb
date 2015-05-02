class Array
  def pair_sum(target)
    pairs = []
    (0...length-1).each do |idx1|
      (idx1+1...length).each do |idx2|
        if self[idx1] + self[idx2] == target
          pairs << [idx1, idx2]
        end
      end
    end
    pairs
  end
end
