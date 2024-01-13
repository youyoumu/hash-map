class HashMap
  def initialize(size = 16)
    @buckets = Array.new(size)
  end

  def hash(value)
    result = 0
    value.each do |char|
      result += char.ord
    end
    result
  end

end
