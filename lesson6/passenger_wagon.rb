require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(name)
    super("passenger",name)
    validate!
  end
end