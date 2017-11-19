module InstanceCounter
  @instances
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end
  end

  module InstanceMethods
    protected
    def register_instances
      self.class.instances += 1
    end
  end

end