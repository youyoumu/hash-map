class Node
  attr_accessor :key, :value, :next_node
  def initialize(key, value)
    @key = key
    @value = value
    @next_node = nil
  end

  def append(node)
    if @next_node.nil?
      @next_node = node
    else
      @next_node.append(node)
    end
  end
end
