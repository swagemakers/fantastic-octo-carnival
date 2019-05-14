class PassengerTrain < Train

  attr_reader :number, :type

  def initialize(number)
    super(number, :passenger)
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage)
  end

  def to_s
    super
  end
end
