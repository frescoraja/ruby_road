class KnightPathFinder
  MOVES = [[2, -1], [2, 1], [1, -2], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]

  def self.valid_moves(position_arr)
    valid_moves = []
    MOVES.each do |moves|
        coord_x = moves[0] + position_arr[0]
        coord_y = moves[1] + position_arr[1]
        if (coord_x >= 0 && coord_x <= 8) && (coord_y >= 0 && coord_y <= 8)
          valid_moves << [coord_x,coord_y]
        end
      end
      valid_moves
  end

  def initialize(position_arr)
    @position = position_arr
    @visited_positions = [position_arr]
    @move_tree = build_move_tree
    @time = Time.now
  end

  def build_move_tree
    root_node = PolyTreeNode.new(@position)

    node_queue = [root_node]
    until node_queue.empty?
      current_node = node_queue.shift
      valid_moves = new_move_positions(current_node.value)
      child_nodes = []
      valid_moves.each do |pos|
        node_queue << PolyTreeNode.new(pos)
        node_queue.last.parent=(current_node)
      end
    end

    root_node
  end


  def find_path(target_position)
		end_node = @move_tree.dfs(target_position)
    path = end_node.trace_path_back
    puts "#{path}"
  end


  def new_move_positions(position_arr)
    new_pos = self.class.valid_moves(position_arr).reject { |pos| @visited_positions.include?(pos) }
    @visited_positions += new_pos
    new_pos
  end
end

# def benchmark(times = 100, &prc)
#   prc ||= proc { "NO BLOCK" }
#   start_time = Time.now
#
#   times.times do
#     prc.call
#   end
#
#   Time.now - start_time
# end
#
# puts benchmark(10000000) do
#   kpf = KnightPathFinder.new([0,0])
#   kpf.find_path([7,7])
#   kpf.find_path([8,8])
#   kpf.find_path([1,1])
# end
