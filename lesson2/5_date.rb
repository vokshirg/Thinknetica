=begin
 Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
 Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным
=end

print "Введите дату рождения в формате dd.mm.yyyy = "
date = gets.chomp.split(".")
day = date[0].to_i
month = date[1]
year = date[2].to_i

months = {
	"01" => 31,
	"02" => 28,
	"03" => 31,
	"04" => 30,
	"05" => 31,
	"06" => 30,
	"07" => 31,
	"08" => 31,
	"09" => 30,
	"10" => 31,
	"11" => 30,
	"12" => 31
}

bissextile = (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0

months["02"] = 29 if bissextile

number = day

months.each do |m,d|
	number += d if m.to_i < month.to_i
end

puts "#{number} является порядковым номером указанной даты с начала года"