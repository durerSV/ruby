class Station 

  def initialize(name)
    @name = name
    @trains = []
  end
  
  def arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end
  def train_list
    @trains
  end

end

class Route
  def initialize(from, to)
    @route = [from, to]
  end

  def add_station (station)
    @route.insert(-2,station)  
  end

  def delete_station(station)
    @route.delete(station)
  end

  def show_route
    @route.each{|station| print "#{station} "}
  end
  def station(number)
    @route[number]
  end

end

class Train
  #attr_reader :speed, :quantity_of_wagons
  def initialize(number, type, quantity_of_wagons)
    @number = number
    @type = type
    @quantity_of_wagons = quantity_of_wagons
    @speed = 0
  end

  def speed_up
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def curent_speed
    @speed
  end

  def wagons
    @quantity_of_wagons
  end
  def add_wagon
    @quantity_of_wagons +=1
  end

  def drop_wagon
    @quantity_of_wagons -= 1 if @speed == 0 && @quantity_of_wagons > 0
  end

  def add_route(route)
    @route = route
    @curent_station = 0
  end

  def forward
    @curent_station += 1
  end

  def back
    @curent_station -= 1
  end

  def curent_stations
    @route.station[curent_station]
  end

  def previous_station
    @route.station[curent_station - 1]
  end

  def next_station
    @route.station[curent_station + 1]
  end

end