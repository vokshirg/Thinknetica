puts "введите стороный треугольника в произвольном порядке"
print "a = "
a = gets.chomp.to_f
print "b = "
b = gets.chomp.to_f
print "c = "
c = gets.chomp.to_f

if a**2 == b**2 + c**2 || b**2 == a**2 + c**2 || c**2 == b**2 + a**2
	print "Треугольник является прямоугольным и "	
else
	print "Треугольник не является прямоугольным, но является "	
end	

if a == b && a == c 
	puts "равносторонним"
elsif a == b || a == c || b == c
	puts "равнобедренным"
else
	puts "все его стороны не равны"
end
