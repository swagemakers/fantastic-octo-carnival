module InstanceCounter

  def self.include
    extend ClassMethods
    include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end

  protected
  module InstanceMethods

    def register_instance
      self.class.instances +=1
    end
  end
end
