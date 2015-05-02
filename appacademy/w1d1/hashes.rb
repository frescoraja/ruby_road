class MyHashSet

  def initialize(default = {})
    @store = default
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    if @store.include?(el)
      @store.delete(el)
      true
    else
      false
    end
  end

  def to_a
    @store.keys
  end

  def union(set2)
    new_hash = self
    set2.to_a.each do |key|
      unless new_hash.include?(key)
        new_hash.insert(key)
      end
    end
    new_hash
  end

  def intersect(set2)
    new_hash = MyHashSet.new
    set2.to_a.each do |key|
      if self.include?(key)
        new_hash.insert(key)
      end
    end
    new_hash
  end

  def minus(set2)
    new_hash = self
    set2.to_a.each do |key|
      if new_hash.include?(key)
        new_hash.delete(key)
      end
    end
    new_hash
  end
end
