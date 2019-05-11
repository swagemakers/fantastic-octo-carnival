class PassengerCarriage < Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :train

  def initialize(available_space)
    @available_space = available_space
    #@quantity = quantity
    #q@not_available = 0
  end

end
