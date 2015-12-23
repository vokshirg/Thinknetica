i  = 10
arr = []

until i > 100 do
  arr << i
  i += 5
end

puts arr.inspect

# another way
arr = []

(2..20).each {|num| arr << num*5}

puts arr.inspect