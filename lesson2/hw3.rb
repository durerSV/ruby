#Заполнить массив числами фибоначчи до 100
fib = [0,1]
loop do 
  next_element = fib[-1] + fib[-2]
  if next_element > 100
    break
  else
    fib << next_element
  end
end
puts fib 