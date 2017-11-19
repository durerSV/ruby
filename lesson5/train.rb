class Train
  
  attr_reader :speed, :wagons, :type, :number

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
  
  end

  def speed_up
    @speed += 10
  end

  def stop
    @speed = 0
  end 

  def add_wagon(wagon)
    @wagons << wagon if @speed == 0 && wagon.type == type
  end

  def drop_wagon
    @wagons.pop if @speed == 0 && @wagons.size > 0
  end

  def add_route(route)
    @route = route
    @curent_station = 0
    curent_station.arrival(self)
  end

  def forward
    curent_station.departure(self)
    @curent_station += 1
    curent_station.arrival(self)
  end

  def back
    curent_station.departure(self)
    @curent_station -= 1
    curent_station.arrival(self)
  end

  def curent_station(cur_st = @curent_station)
    @route.station(cur_st)
  end

  def previous_station
    @route.station(curent_station - 1)
  end

  def next_station
    @route.station(curent_station + 1)
  end

end

class PassengerTrain < Train

  def initialize (number, type = "passenger")
    super(number, type)
  end
end

class CargoTrain < Train
  
  def initialize (number, type = "cargo")
    super(number, type)
  end
end