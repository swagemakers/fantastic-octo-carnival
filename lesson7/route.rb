require_relative "instance_counter.rb"

class Route

  EMPTY_STATION = "Укажите начальную станцию"
  INVALID_STATION = "Станция не зарегистрирована"
  attr_reader :stations #stations are only available for reading

  include InstanceCounter

  def initialize (first_station, last_station)
    @stations = [first_station, last_station] #when creating a new object needs station names as parameters
    validate!
    register_instance
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

  def validate?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, EMPTY_STATION if @stations.any? { |station| station.nil? }
    raise ArgumentError, INVALID_STATION unless @stations.all? { |station| station.is_a?(Station) }
  end
end
