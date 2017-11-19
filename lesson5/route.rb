class Route

  attr_reader :stations, :name

  def initialize(from, to)
    @stations = [from, to]
    @name = "#{from.name}-#{to.name}"
  end

  def add_station (station)
    @stations.insert(-2, station)  
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def print_route
    @stations.each_with_index{|station, index| puts "#{index} - #{station} "}
  end

  def station(number)
    @stations[number]
  end
  

end