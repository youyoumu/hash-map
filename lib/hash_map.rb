require './lib/node.rb'

class HashMap
  def initialize(size = 16, load_factor = 0.75)
    @load_factor = load_factor
    @size = size
    @buckets = Array.new(@size)
  end

  def hash(value)
    result = 100
    value.each do |char|
      result += char.ord
    end
    result % @size
  end

  def set(key, value)
    index = hash(key)
    node = Node.new(key, value)
    if !@buckets[index].nil && @buckets[index].key == key
      next_node = @buckets[index].next_node
      @buckets[index] = node
      node.next_node = next_node
    elsif !@buckets[index].nil && @buckets[index].key != key
      @buckets[index].append(node)
    elsif @buckets[index].nil?
      @buckets[index] = node
    end
  end

  def get_all_nodes
    nodes = []
    @buckets.each do |head|
      nodes += head.gather
    end
    nodes
  end

  def calc_buckets_load
    counter = 0
    @buckets.each do |node|
      counter += 1 unless node.nil?
    end
    counter / @size
  end

  def buckets_almost_full?
    calc_buckets_load >= @load_factor
  end
end
