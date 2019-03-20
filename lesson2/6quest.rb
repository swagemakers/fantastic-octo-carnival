cart = {}
total = 0

loop do 
  puts "Введите название товара или 'стоп', чтобы закончить ввод: "
  title = gets.chomp.downcase 

  break if title == 'стоп'

  puts "Введите цену указанного товара: "
  price = gets.to_f

  puts "Ввелите количество указанного товара: "
  quantity = gets.to_f

  cart[title] = {price: price, quantity: quantity}
end

puts cart

cart.each do |product_name, product_info|
  sum = value[:price] * value[:quantity]
  puts value
  puts "#{key}: #{value[:ptice]} * #{value[:quantity]} = #{sum}"
  total += sum
end

  puts "Итого: #{total}"
