class Route
  attr_reader :stations #stations are only available for reading

  def initialize (first_station, last_station)
    @stations = [first_station, last_station] #when creating a new object needs station names as parameters
  end

  def add_station(station)
    @station.add (insert)
  end

  def delete_station(station)
    @station.delete(station) if @station != first_station && station != last_station
  else
    puts "Impossible to remove"
  end

  def show_stations
    @stations.each { |station| puts station.station_name }
  end
end