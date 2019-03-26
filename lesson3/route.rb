class Route
  attr_reader :stations #stations are only available for reading

  def initialize (first_station, last_station)
    @stations = [first_station, last_station] #when creating a new object needs station names as parameters
  end

  def add_stations(station)
    @stations.add(insert)
  end

  def delete_stations(station)
    return if [stations.first, stations.last].include?(station)
    stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.station_name }
  end
end
