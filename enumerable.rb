module Enumerable

  def my_count(no = nil)
    if no != nil
      i = 0
      self.my_each { |num| i += 1 if no == num }
      return i
    end
    if block_given?
      i = 0
      self.my_each { |num| i += 1 if yield(num) }
      return i
    end
    return self.length
  end

  def my_all?
    if block_given?
      self.my_each { |num| return false if !yield(num)}
      return true
    end
    self.my_each { |num| return false if !num }
    return true
  end

  def my_inject(memo = 0)
    if block_given?
      i = 0
      if memo == 0
        memo = self[0]
        while i < (self.length - 1)
          memo = yield(memo, self[i + 1])
          i += 1
        end
      else
        self.my_each { |element| memo = yield(memo, element) }
      end
      return memo
    end
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

  def my_map
    result = []
    if block_given?
      self.my_each { |num| result << yield(num) }
      return result
    end
    self
  end

  def multiply_els(array)
    array.my_inject { |memo, element| memo * element }
  end

  def my_map(proc = nil)
    result = []
    if proc
      self.my_each { |num| result << proc.call(num) }
    else
      self.my_each { |num| result << yield(num) }
    end
    return result
  end
end
  arr = [88, 77, 98, 56]
  arr.my_each { |num| print "#{num}! " }
  arr.my_each_with_index do |num, index|
    print "#{num}! " if index%2 == 0
  end
  arr.my_select{ |item| item%2==0 }
  arr.my_all? { |num| num >= 2 }
  arr.my_any? { |num| num >= 2 }
  arr.my_none? { |num| num >= 2 }
  arr.my_count { |num| num >= 2 }
  arr.my_map { |num| num * 2 }
  arr.my_inject { |memo, element| memo * element }
  map_proc = Proc.new { |num| num * 2 }
  arr.my_map(map_proc)
  arr.my_map(map_proc) { |num| num * 2 }
