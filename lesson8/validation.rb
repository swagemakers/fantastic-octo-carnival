# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_reader :validations

    def validate(name, type, format)
      @validations ||= {}
      @validations[name] << { name: name, type: type, format: format }
    end
  end

  module InstanceMethods
    PRECENCE_ERROR = 'Не указано значение'
    TYPE_ERROR = 'Не указан тип'
    FORMAT_ERROR = 'Неверный формат'
    format = /A-Z/

    def valid?(*attr)
      validate!
      true
    rescue StandardError
      false
    end


    def validate!
      self.class.validations.each do |name, validations|
        attr_value = instance_variable_get("@#{name}")
        validations.each do|validation|
          send(validation [:type], attr_value, validation [:format])
        end
      end
    end

    def precence_validate(name)
      raise PRECENCE_ERROR if value.nil? || value == ''
    end

    def type_validate(name, type)
      raise TYPE_ERROR unless value.is_a?(type)
    end

    def format_validate(name, format)
      raise FORMAT_ERROR if value !~format
    end
  end
end
