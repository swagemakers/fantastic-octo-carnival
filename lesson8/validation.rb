module Validation

  PresenceError = 'Не указано значение'
  TypeError = 'Не указан тип'
  FormatError = 'Неверный формат'

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, type, attribute)
      #code goes here
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  #end?

  protected

  def validate_precence(name, precence)
    raise PresenceError if @name.nil?
  end

  def validate_type(name, type)
   raise TypeError unless @name.is_a?(type)
  end

  def validate_format(name, format)
    raise FormatError if @name !~ format
  end
  #end?
end
