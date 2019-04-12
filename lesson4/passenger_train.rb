class PassengerTrain < Train #passanger is a train subclass

  attr_reader :number, :type #the number and type of the train are only available for reading

  def initialize(number)
    super(number, :passenger) #recieves all the train methods as its subclass
    @type = "Passenger" #defines the type as passanger
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage) #attaches a carriage only if it's a passanger one
  end
end
