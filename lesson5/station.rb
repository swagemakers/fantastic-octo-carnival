class Station
  attr_reader :trains, :name #trains and station names are only available for reading

  @@all = []

  def self.all 
    return @@all
  end

  def initialize(name)
    @name = name #when creating a new object needs a station name as a parameter
    @trains = []
    @@all << self
  end

  def add_train(train)
    @trains << train #adds a train to the station
  end

  def remove_train(train)
    @trains.delete(train) #removes trains from the station
  end

  def trains_types(type)
    @trains.select { |train| train.type == type } #identifies trains type
  end

  def to_s
    name
  end
end
