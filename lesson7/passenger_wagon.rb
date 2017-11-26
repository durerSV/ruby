require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(name,seats)
    super("passenger",name)
    @seats = seats
    @reserved_space = 0
    validate!
  end
  attr_reader :reserved_space, :seats

  def reserve_space
    @reserved_space += 1
  end

  def free_space
    seats - reserved_space 
  end

private

attr_writer :reserved_space
end