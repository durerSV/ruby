# comment
require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    super(number, 'cargo')
    validate!
  end
end
