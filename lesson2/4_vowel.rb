#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)

#Конечно, не руками. Нужно написать алгоритм, который это сделает. И делаем только для латинского алфавита. В нем тоже есть 
#гласные, заранее определенный список smile Как их определить - в этом и есть суть задания, тут надо подумать.

alpabet = ('a'..'z').to_a

alph_vowels = ["a", "e", "i", "o", "u", "y"]
vowels = {}
alpabet.each_with_index do |l, i|
	vowels[l] = i+1 if alph_vowels.include?(l)
end
	
puts vowels