class PassengerTrain < Train #passanger is a train subclass

  attr_reader :number, :type #the number and type of the train are only available for reading

  def initialize (number)
    super #recieves all the train methods as its subclass
    @type = "Passanger" #defines the type as passanger
  end

  def attachCarriage? (carriage)
    carriage.is_a? (PassangerCarriage) #attaches a carriage only if it's a passanger one
  end
end
