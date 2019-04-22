class Route
  attr_reader :stations #stations are only available for reading

  def initialize (first_station, last_station)
    @stations = [first_station, last_station] #when creating a new object needs station names as parameters
  end

  def add_station(station)
<<<<<<< HEAD
    return if @stations.include?(station)
=======
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
    @stations.insert(-2, station)
  end

  def delete_station(station)
    return if [stations.first, stations.last].include?(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.name }
  end
<<<<<<< HEAD

  def to_s
    "#{stations.first} - #{stations.last}"
  end
=======
>>>>>>> f0878afdd5d3ab7cc7e7c016109fa12bc50ea276
end
