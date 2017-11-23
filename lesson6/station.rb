class Station 
  @@stations = []
  def self.all
    @@stations
  end

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
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

private
  def validate!
    raise "Название станции должно быть длиною не менее 3х сиволов" if name.length < 3
  end
end


