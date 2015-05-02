class PolyTreeNode
  attr_reader  :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def add_child(node)
      node.parent= self
  end

  def bfs(target_value)
    node_queue = []
    node_queue << self
    # current_node = nil
    until node_queue.empty?
      current_node = node_queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        node_queue << child
      end
    end
    nil
  end

  def dfs(target_value)
    return self if target_value == @value
    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end

    nil
  end

  def parent= (node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    node.children << self unless node.nil?   # if new parent nil, we skip adding to its children.
  end

  def remove_child(child)
    raise "Not a child" unless @children.include?(child)
    child.parent=(nil)
  end

  def trace_path_back
    path_array = []
    current_node = self
    until current_node.parent.nil?
      path_array.unshift(current_node.value)
      current_node = current_node.parent
    end
    path_array.unshift(current_node.value)
    path_array
  end

end
