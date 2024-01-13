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
