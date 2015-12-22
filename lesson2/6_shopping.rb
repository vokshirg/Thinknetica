=begin
Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара
(может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп"
в качестве названия товара. На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, 
содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

name = ""
cart = {}
sum = 0

until  name == "стоп"
	
	print "Введите название товара: "
	name = gets.chomp

	next if name == "стоп"

	print "Введите цену за ед.: "
	cost = gets.chomp.to_f
	
	print "Введите количество купленного товара: "
	amount = gets.chomp.to_f

	cart[name] = {cost: cost, amount: amount, sum: amount*cost}
	sum += amount*cost

end

puts cart
puts "Итоговая сумма покупок составляет: #{sum}р."


