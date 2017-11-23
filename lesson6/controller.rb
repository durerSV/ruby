require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'

class Controller 

  def initialize
    @all_stations = []
    @all_trains = []
    @all_routes = []
  end
# 2 следующих метода составляют интерфейс класса, обращение к этим методам из вне, необходимое условие работы программы
  def main_menu 
    puts "Выберите действие"
    puts "1 - Создать станцию"
    puts "2 - Создать поезд"
    puts "3 - Создать маршрут"
    puts "4 - Назначить маршрут поезду"
    puts "5 - Добавить вагон к поезду"
    puts "6 - отцепить вагон от поезда"
    puts "7 - перемещать поезд"
    puts "8 - отобразить список поездов и станций"
    puts "0 - выйти"
  end
  def choise(action)
    case action
    when 0
      abort
    when 1
      puts "Создавать станции"
      station_create
    when 2
      puts "создавать поезда"
      train_create
    when 3
      puts "1 - Создавать маршрут, 2 - добавить станцию в имеющийся, 3 - удалить станцию из имеющегося" 
      answer = gets.chomp.to_i 
      if answer == 1
        route_create
      elsif answer == 2
        add_station_to_route
      else
        delete_station_from_route
      end
    when 4
      puts "Назначать маршрут поезду"
      set_route
    when 5
      puts "Добавлять вагоны к поезду"
      add_wagon_to_train
    when 6
      puts "отцеплять вагоны от поезда"
      drop_wagon_from_train
    when 7
      puts "перемещать поезд по маршруту"
      move_the_train
    when 8
      puts "просматривать список станций и список поездов на станции"
      trains_on_stations      
    end
    rescue RuntimeError => e
      puts "e.message: #{e.message}"
      retry 
  end
 
private #все что ниже будет вызываться только методами данного класса, поскольку наследников нет поместил все в private

attr_accessor :all_stations, :all_trains, :all_routes

 def station_create
    puts "Enter station name"
    title = gets.chomp
    all_stations << Station.new(title)
    puts "Station was created"

 end



 def train_create
    puts "Enter number of train"
    number_of_train = gets.chomp
    puts "Enter type of train '1' if 'cargo' or '2' if 'passenger'"
    type_of_train = gets.chomp.to_i 

    puts "#{ type_of_train == 1 ? CargoTrain.new(number_of_train) : PassengerTrain.new(number_of_train)}"
    all_trains << (type_of_train == 1 ? CargoTrain.new(number_of_train) : PassengerTrain.new(number_of_train))
    puts "#{all_trains}"
 end


 def route_create 
    puts "choise first station"
    all_stations.each_with_index {|station, index| puts "#{index} - #{station.name}"}
    first_station = gets.chomp.to_i
    puts " Начальная станция  - #{@all_stations[first_station].name}"
    puts "choise last station" 
    all_stations.each_with_index {|station, index| puts "#{index} - #{station.name}" if index != first_station} 
    last_station = gets.chomp.to_i
    all_routes << Route.new(all_stations[first_station], all_stations[last_station])
    puts "Route #{all_stations[first_station].name} - #{all_stations[last_station].name} was created"
    all_routes.each_with_index{|route, index| puts "#{index} - #{route.name}" }
 end



 def display_trains(trains = @all_trains)
    trains.each_with_index { |train, index|
      puts "#{index} - #{train.number} - #{train.type}"
    }
 end

 def display_routes
   all_routes.each_with_index{|route, index|puts "#{index} - #{route.name}"}
 end

 def display_stations(stations = all_stations)
   stations.each_with_index{|station,index| puts "#{index} - #{station.name}" }
 end

 def add_station_to_route 
    display_routes
    puts "Введите номер маршрута"
    choisen_route = gets.chomp.to_i    
    free_station = all_stations - all_routes[choisen_route].stations 
    display_stations(free_station)
    puts "Выберите номер станции, которую нужно добавить"
    choisen_station = gets.chomp.to_i
    all_routes[choisen_route].add_station(all_stations[choisen_station])
 end

 def delete_station_from_route
    display_routes
    puts "Введите номер маршрута"
    choisen_route = gets.chomp.to_i
    display_stations(all_routes[choisen_route].stations)
    puts "Выберите номер станции, которую нужно удалить"
    number = gets.chomp.to_i
    all_routes[choisen_route].stations.delete_at(number)
    display_stations(all_routes[choisen_route].stations)
 end

 def set_route
    puts "Выберите номер поезда"
    display_trains
    choisen_train = gets.chomp.to_i
    puts "Выберите номер маршрута"
    display_routes
    choisen_route = gets.chomp.to_i
    all_trains[choisen_train].add_route(all_routes[choisen_route]) 
 end

 def move_the_train
     puts "Выберите номер поезда"
     display_trains
     choisen_train = gets.chomp.to_i
     puts "Наберите '1' - если хотите двигать поезд по маршруту вперед, '2'- если назад"
     answer = gets.chomp.to_i
     answer == 1 ? all_trains[choisen_train].forward : all_trains[choisen_train].back
 end

 def trains_on_stations
    all_stations.each {|station| 
      puts " Название станции #{station.name}: " 
      display_trains(station.trains) 
    }
 end

 def add_wagon_to_train
    puts "Выберите номер поезда"
    display_trains
    choisen_train = gets.chomp.to_i
    puts "введите название фирмы"
    name = gets.chomp
    if all_trains[choisen_train].type == "cargo"
      all_trains[choisen_train].add_wagon(CargoWagon.new(name))
    else
      all_trains[choisen_train].add_wagon(PassengerWagon.new(name))
    end
 end

 def drop_wagon_from_train
  puts "Выберите номер поезда"
  display_trains
  choisen_train = gets.chomp.to_i
  all_trains[choisen_train].drop_wagon
 end


end