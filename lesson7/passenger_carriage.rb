class PassengerCarriage < Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage)
  end

  def occupy_space(_value = 1)
    super(1)
  end

  def to_s
    super
  end

end
