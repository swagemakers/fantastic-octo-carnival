class CargoTrain < Train #cargo is a subclass of train

  attr_reader :number, :type #the number and type of the train are only available for reading

  def initialize(number)
    super(number, :cargo) #recieves all the train methods as a subclass
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage) #adds a carriage only if it's a cargo carriage
  end
<<<<<<< HEAD

  def to_s
    super
  end
=======
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
end
