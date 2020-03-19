sort = [4,3,78,2,0,2]
word_a = ["hi","hello","hey"]

def bubble_sort(sort = [])

(sort.length - 1).times do 
  sort.each.with_index do |a, position|
    next if position == 0
      if sort[position] < sort[position - 1]
      sort[position], sort[position - 1] = sort[position -1], sort[position]
      end
    end
  end  
  sort
end
 
p bubble_sort(sort)

def bubble_sort_by(word_a = [])

  (word_a.length - 1).times do
    word_a.each.with_index do |b, position|
      next if position == 0
      if yield(word_a[position], word_a[position - 1]) < 1
        word_a[position], word_a[position - 1] = word_a[position - 1], word_a[position]
      end
    end 
  end
  word_a
 end

 p (bubble_sort_by(word_a) do |left, right|
    left.length - right.length
  end)
  