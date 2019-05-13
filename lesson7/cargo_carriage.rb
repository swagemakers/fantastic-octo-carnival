class CargoCarriage < Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :number, :type, :total_space, :carriage

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
