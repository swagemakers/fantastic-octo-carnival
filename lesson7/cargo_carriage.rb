class CargoCarriage < Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :total_space

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage)
  end

  def to_s
    super
  end
end
