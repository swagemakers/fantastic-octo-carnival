vowels = %w(a e i o u) #указываем гласные буквы
vowels_hash={} #создаем хеш из гласных 
#присваиваем каждо букве алфавита индекс начиная с 1
#выводиться будет буква=>индекс, так как используется хеш (ключ=>значение)
#указывается буква и индекс, при условии, что буква входит в хеш
("a".."z").each.with_index(1)  do |letter, index|
  vowels_hash[letter] = index if vowels.include?(letter)
end 
puts vowels_hash
