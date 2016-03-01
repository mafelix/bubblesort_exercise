# Sort the array from lowest to highest
require 'benchmark'

#bubblesort

def sort(arr)
  n = arr.length
  loop do
    if n > 1
      swapped = true
      (n-1).times do |x|
        swapped = false
        if arr[x] > arr[x+1]
          arr[x], arr[x+1] = arr[x+1], arr[x]
          swapped = true
        end
      end
    end

    break if swapped == false
    return arr
  end
end

#Find the maximum 
def maximum(arr)
 sort(arr).last
end

def minimum(arr)
  sort(arr).first
end
 
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"



begintime = Time.now
Benchmark.bmbm(100000000) do |x|
  arr = Array.new(100000) {rand(1...100)}
  x.report("sort method:") {sort(arr)}
  x.report("sort:"){arr.sort}
end
endtime = Time.now
puts "#{(endtime - begintime)*1000} milliseconds"