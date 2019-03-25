class Station
  attr_reader :train, :name #trains and station names are only available for reading

  def initialize (station_name)
    @name = name #when creating a new object needs a station name as a parameter
  end

  def add_train(train)
    @train << train #adds a train to the station
  end

  def remove_train(train)
    @train.remove(train) #removes trains from the station
  end

  def train_types(type)
    @train.select {|train| train.type == type} #identifies trains type
  end

  def show_train
    puts @train = [] #shows all the trains at the station
  end
end
