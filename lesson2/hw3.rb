#Заполнить массив числами фибоначчи до 100
fib = [0,1]
next_element = 0
begin 
  next_element = fib[-1] + fib[-2]
  
    fib << next_element
end while next_element + fib[-2] < 100 

puts fib 
