module Enumerable
  def my_none?
    if block_given?
      self.my_each { |num| return false if yield(num)}
      return true
    end
    self.my_each { |num| return false if num }
    return true
  end
  def my_all?
    if block_given?
      self.my_each { |num| return false if !yield(num)}
      return true
    end
    self.my_each { |num| return false if !num }
    return true
  end

  def my_any?
    if block_given?
      self.my_each do |num|
        if yield(num)
          return true
        end
      end
      return false
    end
    self.my_each { |num| return true if num }
    return false
  end

  def my_none?
    if block_given?
      self.my_each { |num| return false if yield(num)}
      return true
    end
    self.my_each { |num| return false if num }
    return true
  end
  
  def my_each_with_index
    i = 0
    if block_given?
      while i < self.length
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_each
    i = 0
    if block_given?
      while i < self.length
        yield(self[i])
        i += 1
      end
    end
    self
  end

  def my_select
    i = 0
    result = []
    if block_given?
      while i < self.length
        value = yield(self[i])
        if value
          result << self[i]
        end
        i += 1
      end
      return result
    end
    self
  end
end
  arr = [88, 77, 98, 56]
  arr.my_each { |num| print "#{num}! " }
  arr.my_each_with_index do |num, index|
    print "#{num}! " if index%2 == 0
  end
