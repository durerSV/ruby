#Заполнить хеш гласными буквами, где значением будет являтся порядковый 
#номер буквы в алфавите (a - 1).
vowels = %w( a e i o u)
hash = Hash.new
('a'..'z').each_with_index do |letter, index|
 if vowels.include?(letter) 
  hash[letter] = index
 end 
end
puts hash 