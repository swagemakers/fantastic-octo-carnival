class CargoTrain < Train #cargo is a subclass of train

  attr_reader :number, :type #the number and type of the train are only available for reading

  def initialize (number)
    super #recieves all the train methods as a subclass
    @type = "Cargo" #defines the type a cargo
  end

  def attachCarriage (carriage)
    carriage.is_a?(CargoCarriage) #adds a carriage only if it's a cargo carriage
  end
end
