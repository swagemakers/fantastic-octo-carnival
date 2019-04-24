require_relative "instance_counter.rb"

class Route
  attr_reader :stations #stations are only available for reading

  def initialize (first_station, last_station)
    @stations = [first_station, last_station] #when creating a new object needs station names as parameters
  end

  def add_station(station)
    return if @stations.include?(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    return if [stations.first, stations.last].include?(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.name }
  end

  def to_s
    "#{stations.first} - #{stations.last}"
  end
end
