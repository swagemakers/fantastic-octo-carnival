days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Введите дату: "
date = gets.to_i

puts "Введите месяц: "
month = gets.to_i

puts"Введите год: "
year = gets.to_i 

days [1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

sum = 0
for i in 0 .. month-2 
  sum += days[i]
 end 

sum += date

puts "Номер даты: #{sum}"