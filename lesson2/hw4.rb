#Заполнить хеш гласными буквами, где значением будет являтся порядковый 
#номер буквы в алфавите (a - 1).
vowels = ['a', 'e', 'i', 'o', 'u']
hash = Hash.new
i = 1
('a'..'z').each do |letter|
 if vowels.include?(letter) 
  hash[letter] = i 
 end 
 i += 1
end
puts hash 