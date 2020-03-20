module Enumerable

  def my_each
    self.length.times do |i|
     yield(self[i])   
    end
  end

  def my_each_with_index
    self.length.times do |i|
      yield(self[i], i)
    end
  end

  def my_select
    a = []
    self.my_each do |i|
      if yield(i) 
        a.push(i)
      end 
    end
    a
  end
  
  def my_all
   self.my_select {|i| yield(i)} == self
  end

  def my_none
    !self.my_all {|i| yield(i)}
  end

  def my_count(n = nil)
    if block_given?
      (self.my_select {|i| yield(i)}).length
    elsif n != nil
      (self.my_select {|j| n == j}).length
    else
      self.length
    end
  end

  def my_map
    arr = []
    self.my_each {|i| arr.push(yield(i))}
    arr
  end

  def my_inject(n = nil)
    new_value = n || self[0]
    
    self.my_each_with_index do |i, index| 
      next if index == 0
      new_value = yield(new_value, i) 
    end
    new_value   
  end
end

def multiply_els(arr)
  arr.my_inject {|x, y| x * y}
end

