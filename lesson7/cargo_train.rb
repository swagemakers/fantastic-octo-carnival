# frozen_string_literal: true

class CargoTrain < Train
  attr_reader :number, :type

  def initialize(number)
    super(number, :cargo)
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage)
  end

  def to_s
    super
  end
end
