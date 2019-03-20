sides = []
puts "Укажите значение первой стороны: "
sides << gets.to_f

puts "Укажите значение второй стороны: "
sides << gets.to_f

puts "Укажите значение третьей стороны: "
sides << gets.to_f

a, b, c = sides.sort!

correct_triangle = a**2 + b **2 == c**2

if correct_triangle && a==b
  puts "Прямоугольный, равнобедренный треугольник"
elsif correct_triangle
  puts "Прямоугольный треугольник"
elsif a == c
  puts "Равнобедренный, равносторонний, но не прямоугольный треугольник"
else
  puts "Треугольник не прямоугольный"
end

		
		