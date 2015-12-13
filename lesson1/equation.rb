puts "Введите коэфициенты"
print "a = "
a = gets.chomp.to_f
print "b = "
b = gets.chomp.to_f
print "c = "
c = gets.chomp.to_f

d = b ** 2 - (4 * a * c)

if d == 0 
	puts "D = 0, корень уравнения Х = #{-b/2/a}"
elsif d > 0
	puts "D = #{d}, Х1 = #{(-b+Math.sqrt(d))/2/a}, Х2 = #{(-b-Math.sqrt(d))/2/a}"
else
	puts "D = #{d}, корней нет"
end
