class One
  def initialize (a,b)
    @a = a 
    @b = b
  end
end

class Two < One
  def initialize(a, b, c) 
    super
    @c = c
  end
  def nspct
    puts " a = #{@a}, b = #{@b} , c = #{@c}"
  end
end

one = Two.new("a", "b", "c")
one.nspct