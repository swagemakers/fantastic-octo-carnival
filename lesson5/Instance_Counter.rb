module InstanceCounter

  def self.include
    extend ClassMethods
    include InstanceMethods
  end

  module ClassMethods

    def instance_quantity
      @instances ||= 0
    end
  end

  protected
  module InstanceMethods

    def register_instance
      self.class.instances +=1
    end
  end
end
