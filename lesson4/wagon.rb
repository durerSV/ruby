class Wagon
  attr_reader :type
  def initialize(type = nil)
    @type = type
  end
end

class PassengerWagon < Wagon
  def initialize
    @type = "passenger"
  end
end

class CargoWagon < Wagon
  def initialize
    @type = "cargo"
  end 
end