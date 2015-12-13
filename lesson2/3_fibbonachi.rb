arr = [0,1]
until arr[-1] + arr[-2] > 100 do
	arr << arr[-1] + arr[-2]
end
puts arr.inspect