module Enumerable

  def my_each(a=[])
    a = []
    a.length.times do |i|
     yield(a[i])   
     a +=1   
    end
  end
end

p my_each([1,2,3,4]) {|a| p a*2}
  

