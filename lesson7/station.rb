require_relative "instance_counter.rb"

class Station
  attr_reader :trains, :name #trains and station names are only available for reading

  REQUIRES_NAME = "У станции должно быть название"

  @@all = []

  include InstanceCounter

  def self.all
    @@all
  end

  def initialize(name)
    @name = name #when creating a new object needs a station name as a parameter
    @trains = []
    validate!
    @@all << self
    register_instance
  end

  def add_carriage(carriage)
    return unless speed.zero?
    return unless attachable_carriage?(carriage)
    @carriages << carriage
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train) #removes trains from the station
  end

  def trains_types(type)
    @trains.select { |train| train.type == type } #identifies trains type
  end

  def each_train
    trains.each.with_index(1) do |train, index|
      puts "#{index} - #{train.to_s}"
    end
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
    raise ArgumentError, REQUIRES_NAME if @name.empty?
  end
end