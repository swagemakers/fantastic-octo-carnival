class Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :train

  def initialize(available_space)
    @available_space = available_space
    @occupied_space = 0
  end

  def occupy_seats(carriage, quantity)
    raise NOT_ENOUGH_SPACE if quantity > available_space
    @available_space -= quantity
    @occupied_space += quantity
  end

end
