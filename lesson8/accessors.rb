module Accsessors
  attr_reader :attr_name

  def self.included(base)
    base.extend Accsessors
  end
  #automatically connects the module to any code
  def strongly_typed_accessor(name, class_attr)
    define_method(name) do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |value|
     if value.is_a?(class_attr)
          instance_variable_set("@#{name}", value)
      else
        raise ArgumentError, "Invalid accessor type"
      end
    end
  end

  def accessor_with_history(name)
    name = name.to_s
    name_with_history = name + '_history'

    self.class_eval ("def #{name}; @#{name}; end")
    self.class_eval %Q{
      def #{name} = (value)
      @#{name_with_history} = [nil] if @#{name_with_history}.nil?
      @#{name_with_history} << value
      @#{name_with_history} = value
    end

    def #{name_with_history}; @{name_with_history}; end}
  end
end
