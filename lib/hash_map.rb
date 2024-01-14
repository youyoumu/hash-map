require './lib/node.rb'

class HashMap
  def initialize(size = 16, load_factor = 0.75)
    @load_factor = load_factor
    @size = size
    @buckets = Array.new(@size)
  end

  def hash(value)
    result = 100
    value.split('').each do |char|
      result += char.ord
    end
    result % @size
  end

  def set(key, value)
    index = hash(key)
    node = Node.new(key, value)
    increase_buckets_size if buckets_almost_full?
    put_node(index, node)
  end

  def get(key)
    index = hash(key)
    if @buckets[index].nil?
      return nil
    else
      row = @buckets[index].gather
      row.each do |node|
        return node.value if node.key == key
      end
      return nil
    end
  end

  def key?(key)
    index = hash(key)
    if @buckets[index].nil?
      return false
    else
      row = @buckets[index].gather
      row.each do |node|
        return true if node.key == key
      end
      return false
    end
  end

  def remove(key)
    return unless key?(key)
    index = hash(key)
    if @buckets[index].key == key
      @buckets[index] = @buckets[index].next_node
    else
      @buckets[index].remove(key)
    end
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
    nodes = clear_next(nodes)
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
      next if head.nil?
      nodes += head.gather
    end
    nodes
  end

  def clear_next(nodes)
    nodes.each do |node|
      node.next_node = nil
    end
    nodes
  end

  def calc_buckets_load
    counter = 0
    @buckets.each do |node|
      counter += 1 unless node.nil?
    end
    counter.to_f / @size.to_f
  end

  def buckets_almost_full?
    calc_buckets_load >= @load_factor
  end

  def print_buckets
    puts "Hash index size: #{@size}"
    puts "Buckets capacity: #{calc_buckets_load * 100}%"
    @buckets.each_with_index do |head, index|
      print "#{index} -> "
      if head.nil?
        puts ''
        next
      end
      row = head.gather
      row.each do |node|
        print "[#{node.key}, #{node.value}] -> "
      end
      puts ''
    end
  end
end
