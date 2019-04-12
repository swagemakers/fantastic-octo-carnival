<<<<<<< HEAD
days = [31, 28, ]
=======
days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Введите дату: "
date = gets.to_i

puts "Введите месяц: "
month = gets.to_i

puts"Введите год: "
year = gets.to_i 

leap_year = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
days [1] = 29 if leap_year

sum = 0#считает дни во всех месяцах до введенного
sum = date + days.take(month - 1).inject(0, :+) #складывает все дни за 
#предыдущие месяцы и количество дней указанных в введном месяце
puts "Номер даты: #{sum}"
>>>>>>> eda508466577ced54d906f6494f4594b9254e8de
