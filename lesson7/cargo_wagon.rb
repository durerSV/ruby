require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(name,volume)
    super("cargo", name)
    @volume = volume
    @reserved_space = 0
    validate!
  end

  attr_reader :reserved_space, :volume 


  def reserve_space(value)
    #raise "превышен объем вагона" if reserved_volume + value > volume
    @reserved_space += value 
  end

  def free_space
    volume - reserved_space
  end

private

  attr_writer :reserved_space

end