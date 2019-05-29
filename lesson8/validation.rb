module Validation

  PresenceError = 'Не указано значение'
  TypeError = 'Не указан тип'
  FormatError = 'Неверный формат'
  format = /A-Z/.i.freeze

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, type, format)
      @validations ||= {}
      @validations << { name: name, type: type, format: format }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate!
      self.class.validate
    end

    def validate_precence(name)
      raise PresenceError if @name.nil? || @name = ''
    end

    def validate_type(name, type)
      raise TypeError unless @name.is_a?(type)
    end

    def validate_format(name, format)
      raise FormatError if @name !~ format
  end
end
