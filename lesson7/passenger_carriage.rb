class PassengerCarriage < Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :train

  def initialize(total_space)
    @total_space = total_space
  end

end
