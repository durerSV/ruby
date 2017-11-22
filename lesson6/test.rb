require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'

def status(train)
  puts "#{train.curent_station}"
  puts "#{train.curent_station.trains}"
  puts "#{train.wagons}"
end

msc = Station.new("Moscow")
spb = Station.new("Saint-Petersburg")
puts "создал станции #{msc} и #{spb}"

spb_msc = Route.new(msc, spb)
puts "создал маршрут #{spb_msc}"

nsk = Station.new ("Novosibirsk")
puts "создал дополнительную станцию #{nsk}"

spb_msc.add_station(nsk)
puts "добавил дополнительную станцию маршруту #{spb_msc}"

train1 = PassengerTrain.new("111","passenger")
puts "создал поезд #{train1.number}"

wagon1 = PassengerWagon.new
puts "создал вагон пассажирский вагон #{wagon1}"

wagon2 = CargoWagon.new
puts "создал грузовой вагон"

train1.add_wagon(wagon1)
puts "добавил вагон к поезду"

train1.add_route(spb_msc)
puts "назначил маршрут поезду"

puts "список поездов на станции #{msc.trains}"

puts "Текущая станция поезда #{train1.number} - #{train1.curent_station.name}"

train1.forward
puts "перемещение вперед"
status(train1)


