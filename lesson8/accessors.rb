# frozen_string_literal: true

module Accessors
  attr_reader :attr_name

  def self.included(base)
    base.extend Accessors
  end

  def strongly_typed_accessor(name, class_attr)
    define_method(name) do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |value|
      if value.is_a?(class_attr)
        instance_variable_set("@#{name}", value)
      else
        raise ArgumentError, 'Invalid accessor type'
       end
    end
  end

  def accessor_with_history(name)
    name = name.to_s
    name_with_history = name + '_history'

    define_method(name) { instance_variable_get("@#{name}") }
    define_method(name_with_history) { instance_variable_get "@#{name_with_history}" }
    define_method("#{name}=") do |value|
      if instance_variable_defined?("@#{name_with_history}")
        instance_variable_get("@#{name_with_history}") << instance_variable_get("@#{name}")
      else
        instance_variable_set("@#{name_with_history}", [])
      end
        instance_variable_set("@#{name}", value)
    end

    define_method(name_with_history.to_s) { instance_variable_get("@#{name_with_history.to_s}") }
  end
end
