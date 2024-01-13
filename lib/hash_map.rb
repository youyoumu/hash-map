class HashMap
  def initialize(size = 16, load_factor = 0.75)
    @size = size
    @buckets = Array.new(@size)
  end

  def hash(value)
    result = 0
    value.each do |char|
      result += char.ord
    end
    result
  end

end
