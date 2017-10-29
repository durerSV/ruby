class Station 

  attr_reader :trains

  def initialize(name)
    @name = name
    self.trains = []
  end
  
  def arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def trains_at_type(type)
    trains.select{|a| a.type = type}
  end

end

class Route

  attr_reader :route

  def initialize(from, to)
    @route = [from, to]
  end

  def add_station (station)
    @route.insert(-2, station)  
  end

  def delete_station(station)
    @route.delete(station)
  end

  def print_route
    @route.each{|station| print "#{station} "}
  end

  def station(number)
    @route[number]
  end

end

class Train

  attr_reader :speed, :quantity_of_wagons, :type

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

  def add_wagon
    @quantity_of_wagons += 1 if @speed == 0
  end

  def drop_wagon
    @quantity_of_wagons -= 1 if @speed == 0 && @quantity_of_wagons > 0
  end

  def add_route(route)
    @route = route
    @curent_station = 0
    @route[@curent_station].arrival(self)
  end

  def forward
    @route[@curent_station].departure(self)
    @curent_station += 1
    @route[@curent_station].arrival(self)
  end

  def back
    @route[@curent_station].departure(self)
    @curent_station -= 1
    @route[@curent_station].arrival(self)
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