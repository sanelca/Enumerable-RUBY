module Enumerable
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

  end
  arr = [88, 77, 98, 56]
  arr.my_each { |num| print "#{num}! " }
  arr.my_each_with_index do |num, index|
    print "#{num}! " if index%2 == 0
  end
