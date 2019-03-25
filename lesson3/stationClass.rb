class Station
  attr_reader :trains, :station_name #trains and station names are only available for reading

  def initialize (station_name, trains)
    @station_name = station_name #when creating a new object needs a station name as a parameter
    @trains = [] #trains that are at the station at the moment
  end

  def add_trains(train)
    @trains << train #adds a train to the station
  end

  def remove_trains(train)
    @trains.remove(train) #removes trains from the station
  end

  def train_types(type)
    @train.select {|train| train.type == type} #identifies trains type
  end

  def show_trains
    puts @trains = [] #shows all the trains at the station
  end
end

class Route
  attr_reader :stations #stations are only available for reading

  def initialize (first_station, last_station)
    @stations = [first_station, last_station] #when creating a new object needs station names as parameters
  end

  def add_station(station)
    @station.add (insert)
  end

  def delete_station(station)
    @station.delete(station)
  end

  def show_stations
    @stations.each {|stations| puts stations}
  end
end

class Train
  attr_reader :speed, :type, :carriage, :number

  def initialize (carriage, number, type)
    @number = number
    @carriage = []
    @speed = 0
    @type = type
  end

  def stop
    @speed == 0 #train doesn't move
  end

  def start_engine
    @speed == 5 #speeds the train uo to 5
  end

  def show_speed
    puts @speed
  end

  def add_carriage
    @carriage += 1 if @speed == 0 #adds a new carriage to the train if it doesn't move
  end

  def remove_carriage
    @carriage -= 1 if @speed == 0 && @carriage != 0 #deletes a carriage from the train if it doesn't move and the number of carriages is not 0
  end

  def carriage_quantity
    puts @carriage = [] #puts how many carriages a train has
  end

  def lists (set_route)
    @list = set_route #supposedly sets a route for the train to follow
    @ifndex == 0
  end

  def go_further
    if @list && @index < @list.name.length - 1 #moves the train one station further, taking the past station of the list of next stations
      @index += 1
      move
    else
      puts "Nowhere to go" #if the train meets the last station, stops
    end
  end

  def go_back
    if @list && @index >=0 #moves the train one station backwards, takes a station from the index (stations it already passed)
      @index -= 1
      move
    else
      puts "Nowhere to go" #if the train meets the first station, stops
    end
  end

  def current_station
    if @list
      @list.name[@index] #puts the station name
    else
  puts "No data" #doesn't
  end

  def previous_station
    if @list
      @list.name[@index - 1]
    else
      puts "No data"
    end
  end

  def next_station
    if @list
      @list.name[@index + 1]
    else
      puts "No data"
    end
  end
end
end
