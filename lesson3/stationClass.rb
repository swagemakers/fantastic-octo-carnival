class Station
  attr_reader :trains, :station_name #trains and station names are only available for reading

  def initialization (station_name)
    @station_name = station_name #when creating a new object needs a station name as a parameter
    @train = [] #a massive to store the trains that will be crossing this station possibly?
  end

  def add_trains(train)
    @trains << train #adds a new train to the trains massive
  end

  def remove_trains(train)
    @trains.remove(train) #removes trains from the train massive
  end

  def train_types(type)
    @train.select {|train| train.type == type} #identifies trains type
  end

  def self.all
    @all ||=[]
  end

  def to_s
    title #makes sure that the program reads the title as a string
  end
end
