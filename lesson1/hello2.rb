puts "Как тебя зовут?"
name = gets.chomp
puts "В каком году ты родился?"
year = gets.chomp.to_i

puts "Привет, #{name}! Тебе #{2015 - year} лет" 