class Node
  attr_accessor :value, :next
  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
  end
end
