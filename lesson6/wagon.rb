require_relative 'manufacturer'
class Wagon
  include Manufacturer
  attr_reader :type
  def initialize(type = nil, name = nil)
    @type = type
    self.name = name
    raise
  end

  private

  def valid
    raise "укажите название фирмы" if self.name == nil
  end

end



