# comment
class Route
  attr_reader :stations, :name

  def initialize(from, to)
    @stations = [from, to]
    @name = "#{from.name}-#{to.name}"
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def print_route
    @stations.each_with_index { |station, index| puts "#{index} - #{station} " }
  end

  def station(number)
    @stations[number]
  end

  private

  def validate!
    raise 'Выберите существующую станцию' if @stations[0].nil? || @stations.last.nil?
    raise 'Станция должна являтся объектом класса Station' if @stations[0].class != Station || @stations.last.class != Station
    raise 'Имя не может быть пустым' if @name.nil?
  end
end
