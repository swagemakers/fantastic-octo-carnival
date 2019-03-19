print "Как Вас зовут?"
name=gets.chomp
print "Каков Ваш рост?"
height=gets.chomp.to_i
ideal_weight=height-110
if ideal_weight<0
	puts "Ваш вес оптимальный"
else
	puts "#{name}, ваш реузльтат #{ideal_weight}"
end