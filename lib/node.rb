class Node
  attr_accessor :key, :value, :next_node
  def initialize(key, value)
    @key = key
    @value = value
    @next_node = nil
  end

  def append(node)
    if @key == node.key
      @value = node.value
    elsif @next_node.nil?
      @next_node = node
    else
      @next_node.append(node)
    end
  end

  def gather
    if @next_node.nil?
      return [self]
    else
      return [self] + @next_node.gather
    end
  end
end
