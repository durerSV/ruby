require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(name)
    super("cargo", name)
  end 
end