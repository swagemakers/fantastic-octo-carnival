# frozen_string_literal: true

module Validation
  PresenceError = 'Не указано значение'
  TypeError = 'Не указан тип'
  FormatError = 'Неверный формат'
  # format = /A-Z/.i.freeze

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

    def validate! # not finished
      self.class.validates
      # should decide what validation to do
      # based on the pararmeters it got
    end

    def validate_precence(_name)
      raise PresenceError if @name.nil? || @name == ''
    end

    def validate_type(_name, type)
      raise TypeError unless @name.is_a?(type)
    end

    def validate_format(_name, format)
      raise FormatError if @name !~ format
    end
  end
end
