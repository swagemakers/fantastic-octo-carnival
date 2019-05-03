require_relative "instance_counter.rb"

class Station
  Requires_Name = "У станции должно быть название"

  attr_reader :trains, :name #trains and station names are only available for reading

  @@all = []
  
  include InstanceCounter

<<<<<<< HEAD:lesson6/station.rb
  include InstanceCounter

  def self.all
=======
  def self.all 
>>>>>>> c2c7f6851b5c709c820401424f6665496dbb517a:lesson5/station.rb
    @@all
  end

  def initialize(name)
    @name = name #when creating a new object needs a station name as a parameter
    @trains = []
    @@all << self
    register_instance
<<<<<<< HEAD:lesson6/station.rb
    validate!
=======
>>>>>>> c2c7f6851b5c709c820401424f6665496dbb517a:lesson5/station.rb
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

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, Requires_Name if @name.empty?
  end
end