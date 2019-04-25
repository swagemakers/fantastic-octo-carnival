module InstanceCounter

  def self.included
    extend ClassMethods
    include InstanceMethods
  end

  module ClassMethods
    attr_writer :instances

    def instances
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
