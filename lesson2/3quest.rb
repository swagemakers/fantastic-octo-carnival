fibonacci = [0,1]
num = 1 

while num <=100 do 
  fibonacci << num
  num = fibonacci[-2] + fibonacci[-1]
end

puts fibonacci 