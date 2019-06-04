# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, options = nil)
      @validations = []
      @validations[name] << { name: name, type: type, options: options }
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
      self.class.validations.each do |name, validations|
        attr_value = instance_variable_get("@#{name}")
        method_name = "#{validation[:type]}_validate"
        validations.each do |validation|
          send(method_name, attr_value, validation[:options])
        end
      end
    end

    def precence_validate(name, _)
      raise PRECENCE_ERROR if value.nil? || value == ''
    end

    def type_validate(name, type)
      raise TYPE_ERROR unless value.is_a?(type)
    end

    def format_validate(name, format)
      raise FORMAT_ERROR if value !~ format
    end
  end
end
