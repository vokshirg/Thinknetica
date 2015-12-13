puts "Введите свой рост"
height = gets.chomp.to_f
# height = height.to_f

if height <= 110
	puts "У Вас идеальный вес!"
elsif height <= 0
	puts "Вы ввели неверное значение"
else
	puts "Ваш идеальный вес #{height - 110}кг"
end
