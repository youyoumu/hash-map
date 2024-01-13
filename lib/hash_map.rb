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
    put_node(index, node)
  end

  def put_new_head_node(index, node)
    @buckets[index] = node
  end

  def append_node(index, node)
    @buckets[index].append(node)
  end

  def put_node(index, node)
    if @buckets[index].nil?
      put_new_head_node(index, node)
    else
      append_node(index, node)
    end
  end

  def increase_buckets_size
    nodes = get_all_nodes
    @size = @size * 2
    @buckets = Array.new(@size)
    nodes.each do |node|
      index = hash(node.key)
      put_node(index, node)
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
