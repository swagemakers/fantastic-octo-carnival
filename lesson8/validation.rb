# frozen_string_literal: true

module Validation
  def self.included(base)
   base.extend ClassMethods
   base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, options = nil)
      @validations ||= []
      @validations << { name: name, type: type, options: options }
    end
  end

  module InstanceMethods
    PRECENCE_ERROR = 'Не указано значение'
    TYPE_ERROR = 'Не указан тип'
    FORMAT_ERROR = 'Неверный формат'

    def valid?(*_attr)
      validate!
      true
    rescue StandardError
      false
    end

    def validate!
      self.class.validations.each do |validation|
        attr_value = instance_variable_get("@#{validation[:name]}")
        method_name = "#{validation[:type]}_validate"
        send(method_name, attr_value, validation[:options])
      end
    end

    def precence_validate(value, _)
     raise PRECENCE_ERROR if value.nil? || value == ''
    end

    def type_validate(value, type)
     raise TYPE_ERROR unless value.is_a?(type)
    end

    def format_validate(value, format)
     raise FORMAT_ERROR if value !~ format
    end
  end
end
