module Accsessors
  attr_reader :attr_name

  def strongly_typed_accessor(name, class_attr)
    define_method(name) do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |value|
      if value.is_a?(class_attr)
        instance_variable_set("@#{name}, value")
      else
        raise ArgumentError, "Invalid accessor type"
      end
    end
  end
end
