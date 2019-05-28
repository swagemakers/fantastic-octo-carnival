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
    def validate(name, type, format) #gets the validation_type smh

      define_method validate_precence(name)
        raise PresenceError if @name.nil? || @name = ''
      end

      define_method validate_type(name, type)
        raise TypeError unless @name.is_a?(type)
      end

      define_method validate_format(name, format)
        raise FormatError if @name !~ format
      end
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue #error type
      false
    end
  end
end
