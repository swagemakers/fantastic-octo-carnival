class PassengerTrain < Train #passanger is a train subclass

  attr_reader :number, :type #the number and type of the train are only available for reading

  def initialize(number)
    super(number, :passenger) #recieves all the train methods as its subclass
    @type = "Passanger" #defines the type as passanger
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage) #adds a carriage only if it's a cargo carriage
  end

  def to_s
    super
  end
end
