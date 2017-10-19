=begin
 Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). 
 Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. 
На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара 
и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

basket = {}
#total = 0
puts "Enter product or type 'stop' "
answer = String(gets.chomp)
until answer == 'stop' do
  product =  answer
  puts "Enter price"
  price = Integer(gets.chomp)
  puts "Enter quantity"
  quantity = Float(gets.chomp)
  basket [product] = {price: price, quantity: quantity, sum: price * quantity}
  #total += basket[product][:sum]
  puts "Enter product or type 'stop' "
  answer = String(gets.chomp)
end
basket.each do |k, v| 
  puts "product: #{k}, quantity #{v[:quantity]}, sum #{v[:sum]} "
  total += v[:sum]
end
puts "TOTAL = #{total}"