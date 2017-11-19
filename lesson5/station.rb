class Station 
  @@stations = []
  def self.all
    @@stations
  end

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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

end
