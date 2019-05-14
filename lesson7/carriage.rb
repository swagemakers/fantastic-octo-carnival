class Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  def initialize(total_space)
    @total_space = total_space
    @occupied_space = 0
  end

  def occupy_space(value)
    raise NOT_ENOUGH_SPACE if value > @available_space
    @occupied_space =+ value
  end

  def available_space
    @total_space - @occupied_space
  end

end
