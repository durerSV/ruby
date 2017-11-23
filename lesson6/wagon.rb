require_relative 'manufacturer'
class Wagon
  include Manufacturer
  attr_reader :type
  def initialize(type = nil, name = nil)
    @type = type
    self.name = name
    validate!
  end

  protected

  def validate!
    raise "укажите название фирмы" if self.name == nil
  end

end  
