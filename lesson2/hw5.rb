=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
=end
days_in_month = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter year"
year = Integer(gets.chomp)
if (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))
  days_in_month[2] = 29
end

puts "Enter number of month"
month = Integer(gets.chomp)

puts "Enter day"
number_of_day = Integer(gets.chomp)

days = days_in_month.take(month)
days.each {|e| number_of_day += e}

puts number_of_day