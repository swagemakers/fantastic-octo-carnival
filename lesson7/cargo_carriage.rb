class CargoCarriage < Carriage

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :number, :type, :total_space, :carriage #the number and type of the train are only available for reading

  def initialize(number)
    super(number, :cargo) #recieves all the train methods as its subclass#defines the type as passanger
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage) #adds a carriage only if it's a cargo carriage
  end

  def to_s
    super
  end
end
