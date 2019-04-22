class Station
  attr_reader :train, :name #trains and station names are only available for reading

  def initialize(name)
    @name = name #when creating a new object needs a station name as a parameter
    @trains = []
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
<<<<<<< HEAD

  def to_s
    name
  end
=======
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
end
